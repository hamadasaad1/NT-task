import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/features/question/presentation/widgets/question_list_item_widget.dart';
import 'package:template/shared/common/widget/custom_empty_widget.dart';
import 'package:template/shared/common/widget/custom_image_widget.dart';
import 'package:template/shared/common/widget/custom_shimmer_widget.dart';
import 'package:template/shared/common/widget/refresh_widget.dart';
import 'package:template/shared/resources/assets_manager.dart';
import 'package:template/shared/resources/color_manager.dart';
import 'package:template/shared/resources/manager_values.dart';
import 'package:template/shared/resources/size_config.dart';
import 'package:template/shared/resources/styles_manager.dart';
import 'package:template/utils.dart';

import '../../../../app/Debouncer.dart';
import '../../../../app/network/connectivity_service.dart';
import '../../../../shared/common/widget/button_widget.dart';
import '../../../../shared/common/widget/custom_alert_dialog.dart';
import '../../../../shared/common/widget/drawer_widget.dart';
import '../../../../shared/common/widget/text_filed_widget.dart';
import '../../../../shared/resources/font_manager.dart';
import '../../data/models/question_model.dart';
import '../model/input_get_question.dart';
import '../provider/question_provider.dart';
import '../widgets/add_question_widget.dart';

class QuestionScreen extends ConsumerStatefulWidget {
  const QuestionScreen({super.key});

  @override
  ConsumerState<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends ConsumerState<QuestionScreen> {
  bool isLoading = true;
  List<Question> listQuestion = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final debouncer = DebouncerClass(seconds: 2);
  var searchController = TextEditingController();
  Status? questionStatus;

  void _getSearch() {
    if (searchController.text.isEmpty && questionStatus == null) {
      ref.read(questionNotifierProvider.notifier).getAllQuestions();
    } else {
      ref.read(questionNotifierProvider.notifier).searchQuestion(
            search: InputGetQuestion(
              name: searchController.text,
              status: questionStatus,
            ),
          );
    }
  }

  @override
  void initState() {
    super.initState();

    ConnectivityService().connectivityStream.listen((status) {
      if (status) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(questionNotifierProvider.notifier).checkDataWhenOnline();
        });
      }
    });

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   ref.read(questionNotifierProvider.notifier).init();
    // });
  }

  @override
  void dispose() {
    debouncer.cancel();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final questionState = ref.watch(questionNotifierProvider);

    // Update listQuestion and loading state based on the QuestionState
    questionState.maybeWhen(
      success: (entity) {
        isLoading = false;
        listQuestion = entity;
      },
      error: (failure) {
        isLoading = false;
      },
      orElse: () {},
    );

    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: Text(
          'Questions',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        // onBackPress: () {
        //   _scaffoldKey.currentState?.openDrawer();
        // },
        centerTitle: true,

        leading: InkWell(
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          child: Container(
            padding: getPadding(all: AppPadding.p16),
            width: AppSize.s12,
            height: AppSize.s12,
            child: const Icon(Icons.menu, color: ColorManager.primary),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: ColorManager.primary),
            onPressed: () {
              buildDialogForAddOrEdit(context);
            },
          )
        ],
      ),
      body: Padding(
        padding: getPadding(all: AppPadding.p16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CustomTextField(
                    controller: searchController,
                    hintText: "Search questions",
                    textInputType: TextInputType.text,
                    prefixIcon:
                        CustomSvgImage(imageName: Assets.assetsSvgSearch),
                    validate: (value) {
                      return null;
                    },
                    onChangedCallback: (value) {
                      if (value.isEmpty) {
                        ref
                            .read(questionNotifierProvider.notifier)
                            .getAllQuestions();
                        return;
                      }
                      debouncer.cancel();
                      debouncer.run(() {
                        _getSearch();
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                IconButton(
                  icon: const Icon(Icons.menu, color: ColorManager.primary),
                  onPressed: () {
                    _openFilterBottomSheet(context);
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            isLoading
                ? Expanded(
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return const CustomShimmerLoading();
                      },
                    ),
                  )
                : listQuestion.isEmpty
                    ? const Expanded(
                        child: Center(
                          child: CustomEmptyScreen(
                            title: 'No Data',
                          ),
                        ),
                      )
                    : Expanded(
                        child: RefreshWidget(
                          onRefresh: () async {
                            setState(() {
                              isLoading = true;
                            });
                            ref
                                .read(questionNotifierProvider.notifier)
                                .getAllQuestions();
                          },
                          child: ListView.separated(
                            itemCount: listQuestion.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(height: 16);
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return Utils().createHero(
                                tag: listQuestion[index].id.toString(),
                                child: QuestionListItemWidget(
                                  onDelete: () {
                                    buildDialogForDelete(context,
                                        id: listQuestion[index].id);
                                  },
                                  onEdit: () {
                                    buildDialogForAddOrEdit(context,
                                        model: listQuestion[index]);
                                  },
                                  model: listQuestion[index],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
          ],
        ),
      ),
    );
  }

  buildDialogForAddOrEdit(BuildContext context, {Question? model}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => Padding(
        padding: getPadding(horizontal: 24),
        child: CustomAlertDialog(
          content: Padding(
            padding: getPadding(all: AppSize.s16),
            child: AddQuestionWidget(model: model),
          ),
        ),
      ),
    ).then((value) {
      if (value != null) {
        ref
            .read(questionNotifierProvider.notifier)
            .addOrUpdateQuestion(model: value);
      }
    });
  }

  buildDialogForDelete(BuildContext context, {required String id}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => Padding(
        padding: getPadding(horizontal: 24),
        child: CustomAlertDialog(
          content: Padding(
            padding: getPadding(all: AppSize.s16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Text(
                        'Delete Question',
                        style: getBoldStyle(),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.close),
                    ),
                  ],
                ),
                const SizedBox(height: AppSize.s16),
                Text(
                  'Are you sure you want to delete this Question?',
                  style: getMediumStyle(),
                ),
                const SizedBox(height: AppSize.s20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: CustomButton(
                        onPress: () {
                          Navigator.pop(context);
                        },
                        isFilledColor: false,
                        labelText: 'Cancel',
                        fontSize: FontSize.s14,
                      ),
                    ),
                    const SizedBox(width: AppPadding.p16),
                    Expanded(
                      child: CustomButton(
                        onPress: () {
                          Navigator.pop(context);
                          ref
                              .read(questionNotifierProvider.notifier)
                              .deleteQuestion(id: id);
                        },
                        labelText: 'Delete',
                        fontSize: FontSize.s14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to open the bottom sheet
  void _openFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: getPadding(all: AppPadding.p16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Select Difficulty",
                      style: Theme.of(context).textTheme.titleMedium),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close))
                ],
              ),
              const SizedBox(height: 10),
              _buildStatusItem(context, Status.easy, "Easy"),
              _buildStatusItem(context, Status.medium, "Medium"),
              _buildStatusItem(context, Status.hard, "Hard"),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      isFilledColor: false,
                      onPress: () {
                        Navigator.pop(context);
                      },
                      labelText: 'Cancel',
                      fontSize: FontSize.s14,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomButton(
                      onPress: () {
                        setState(() {
                          questionStatus = null;
                        });
                        Navigator.pop(context);

                        _getSearch();
                      },
                      labelText: 'Clear',
                      fontSize: FontSize.s14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatusItem(BuildContext context, Status status, String label) {
    return ListTile(
      title: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: questionStatus == status
          ? const Icon(Icons.check_circle, color: Colors.green)
          : const Icon(Icons.circle_outlined),
      onTap: () {
        setState(() {
          questionStatus = status;
        });
        _getSearch();
        Navigator.pop(context);
      },
    );
  }
}
