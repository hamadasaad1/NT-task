import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/features/tips/presentation/widgets/add_tip_widget.dart';

import '../../../../shared/common/state_renderer/state_renderer.dart';
import '../../../../shared/common/widget/component.dart';
import '../../../../shared/common/widget/custom_alert_dialog.dart';
import '../../../../shared/common/widget/custom_empty_widget.dart';
import '../../../../shared/common/widget/custom_loading_screen.dart';
import '../../../../shared/resources/color_manager.dart';
import '../../../../shared/resources/manager_values.dart';
import '../../../../shared/resources/size_config.dart';
import '../../data/models/tips_model.dart';
import '../provider/tips_provider.dart';

class TipPage extends ConsumerStatefulWidget {
  const TipPage({Key? key}) : super(key: key);

  @override
  ConsumerState<TipPage> createState() => _TipPageState();
}

class _TipPageState extends ConsumerState<TipPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(tipNotifierProvider.notifier).init();
    });
  }

  bool isLoading = true;
  List<Tip> listTips = [];

  @override
  Widget build(BuildContext context) {
    // Watch the tip state from the tipNotifierProvider
    final tipState = ref.watch(tipNotifierProvider);

    tipState.maybeWhen(
      success: (entity) {
        isLoading = false;
        listTips = entity;
      },
      error: (failure) {
        isLoading = false;
      },
      orElse: () {},
      addLoading: () => showPopupDialog(
          context: context,
          stateRendererType: StateRendererType.popupLoadingState),
      addSuccess: () => dismissDialog(context),
      addError: (message) => dismissDialog(
        context,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Interview Tips & Tricks'),
        centerTitle: true,
        actions: [
          // Add button that triggers the add/edit dialog
          IconButton(
            icon: const Icon(Icons.add, color: ColorManager.primary),
            onPressed: () {
              buildDialogForAddOrEdit(context, ref);
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CustomLoadingScreen())
          : listTips.isEmpty
              ? const Center(
                  child: CustomEmptyScreen(
                  title: 'No tips yet',
                ))
              : PageView.builder(
                  itemCount: listTips.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onLongPress: () {
                        _showProTip(context, listTips[index]);
                      },
                      child: Card(
                        margin: const EdgeInsets.all(16),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              listTips[index].content,
                              style: const TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }

  // Show a dialog with advanced strategy (Pro Tip) when long pressed
  void _showProTip(BuildContext context, Tip tip) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pro Tip'),
          content: Text(tip.advancedStrategy ?? 'No pro tip available.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Show a dialog for adding or editing a tip
  buildDialogForAddOrEdit(BuildContext context, WidgetRef ref, {Tip? model}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => Padding(
        padding: getPadding(horizontal: 24),
        child: CustomAlertDialog(
          content: Padding(
            padding: getPadding(all: AppSize.s16),
            child: AddTipWidget(model: model),
          ),
        ),
      ),
    ).then((value) {
      if (value != null) {
        // After dialog closes, update or add the tip
        ref.read(tipNotifierProvider.notifier).addOrUpdateTip(model: value);
      }
    });
  }
}
