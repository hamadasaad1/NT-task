import 'package:flutter/material.dart';
import 'package:template/shared/common/widget/text_filed_widget.dart';

import '../../../../shared/common/widget/button_widget.dart';
import '../../../../shared/resources/font_manager.dart';
import '../../../../shared/resources/manager_values.dart';
import '../../../../shared/resources/styles_manager.dart';
import '../../data/models/tips_model.dart';

class AddTipWidget extends StatefulWidget {
  final Tip? model;

  const AddTipWidget({
    Key? key,
    this.model,
  }) : super(key: key);

  @override
  State<AddTipWidget> createState() => _AddTipWidgetState();
}

class _AddTipWidgetState extends State<AddTipWidget> {
  var nameController = TextEditingController();
  var descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.model != null) {
      nameController.text = widget.model!.content;
      descriptionController.text = widget.model!.advancedStrategy ?? '';
    }
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Text(
                  'Add Tip',
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
          CustomTextField(
            hintText: 'Tip',
            controller: nameController,
            maxLines: 2,
          ),
          const SizedBox(height: AppSize.s16),
          CustomTextField(
            hintText: 'Tracks',
            controller: descriptionController,
            maxLines: 5,
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
                    if (_formKey.currentState!.validate()) {
                      var model = Tip(
                        content: nameController.text,
                        id: widget.model?.id ??
                            '${DateTime.now().millisecondsSinceEpoch}',
                        advancedStrategy: descriptionController.text,
                      );
                      Navigator.pop(context, model);
                    }
                  },
                  labelText: 'Save',
                  fontSize: FontSize.s14,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
