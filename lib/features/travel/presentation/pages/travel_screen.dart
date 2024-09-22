import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/features/travel/presentation/cubit/travel_cubit.dart';
import 'package:template/features/travel/presentation/widgets/travel_list_item_widget.dart';
import 'package:template/shared/common/widget/custom_empty_widget.dart';
import 'package:template/shared/common/widget/custom_shimmer_widget.dart';
import 'package:template/shared/common/widget/refresh_widget.dart';
import 'package:template/shared/resources/color_manager.dart';
import 'package:template/shared/resources/manager_values.dart';
import 'package:template/shared/resources/size_config.dart';
import 'package:template/shared/resources/styles_manager.dart';

import '../../../../app/network/connectivity_service.dart';
import '../../../../app/service_locator.dart';
import '../../../../shared/common/state_renderer/state_renderer.dart';
import '../../../../shared/common/widget/button_widget.dart';
import '../../../../shared/common/widget/component.dart';
import '../../../../shared/common/widget/custom_alert_dialog.dart';
import '../../../../shared/resources/font_manager.dart';
import '../../data/models/travel_destination.dart';
import '../widgets/add_travel_widget.dart';

class TravelScreen extends StatefulWidget {
  const TravelScreen({super.key});

  @override
  State<TravelScreen> createState() => _TravelScreenState();
}

class _TravelScreenState extends State<TravelScreen> {
  late TravelCubit _viewModel;
  bool isLoading = true;
  List<TravelDestination> listTravel = [];

  @override
  void initState() {
    initTravelModule();

    ConnectivityService().connectivityStream.listen((status) {
      print('connectivity $status: status');
      if (status) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _viewModel.checkDataWhenOnline();
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: ColorManager.primary),
            onPressed: () {
              buildDialogForAddOrEdit(context);
            },
          )
        ],
      ),
      body: BlocProvider<TravelCubit>(
        create: (context) {
          _viewModel = TravelCubit();
          _viewModel.getAllTravel();
          return _viewModel;
        },
        child: BlocConsumer<TravelCubit, TravelState>(
          listener: (context, state) {
            if (state is TravelSuccessState) {
              isLoading = false;
              listTravel = [];
              listTravel.addAll(state.entity);
            }
            if (state is TravelErrorState) {
              isLoading = false;
            }
            if (state is TravelAddLoadingState) {
              showPopupDialog(
                  context: context,
                  stateRendererType: StateRendererType.popupLoadingState);
            }

            if (state is TravelAddSuccessState) {
              dismissDialog(context);
              showSnackBar(context, 'Add Success');
            }

            if (state is TravelAddErrorState) {
              dismissDialog(context);

              showPopupDialog(
                  context: context,
                  message: state.failure.message,
                  stateRendererType: StateRendererType.popupErrorState);
            }

            if (state is TravelDeleteLoadingState) {
              showPopupDialog(
                  context: context,
                  stateRendererType: StateRendererType.popupLoadingState);
            }

            if (state is TravelDeleteSuccessState) {
              dismissDialog(context);
              showSnackBar(context, 'Delete Success');
            }

            if (state is TravelDeleteErrorState) {
              dismissDialog(context);

              showPopupDialog(
                  context: context,
                  message: state.failure.message,
                  stateRendererType: StateRendererType.popupErrorState);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: getPadding(all: AppPadding.p16),
              child: Column(
                children: [
                  isLoading
                      ? Expanded(
                          child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return const CustomShimmerLoading();
                            },
                          ),
                        )
                      : listTravel.isEmpty
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
                                  _viewModel.getAllTravel();
                                },
                                child: ListView.separated(
                                  itemCount: listTravel.length,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(
                                      height: 16,
                                    );
                                  },
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return TravelListItemWidget(
                                        onDelete: () {
                                          buildDialogForDelete(context,
                                              id: listTravel[index].id);
                                        },
                                        onEdit: () {
                                          buildDialogForAddOrEdit(context,
                                              model: listTravel[index]);
                                        },
                                        model: listTravel[index]);
                                  },
                                ),
                              ),
                            ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  buildDialogForAddOrEdit(
    BuildContext context, {
    TravelDestination? model,
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => Padding(
        padding: getPadding(horizontal: 24),
        child: CustomAlertDialog(
          content: Padding(
            padding: getPadding(all: AppSize.s16),
            child: AddTravelWidget(model: model),
          ),
        ),
      ),
    ).then((value) {
      if (value != null) {
        _viewModel.addOrUpdateTravel(model: value);
      }
    });
  }

  buildDialogForDelete(
    BuildContext context, {
    required String id,
  }) {
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
                        'Delete Travel',
                        style: getBoldStyle(),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.close))
                  ],
                ),
                const SizedBox(height: AppSize.s16),
                Text('Are you sure you want to delete this travel?',
                    style: getMediumStyle()),
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
                          _viewModel.deleteTravel(id: id);
                        },
                        labelText: 'Delete',
                        fontSize: FontSize.s14,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
