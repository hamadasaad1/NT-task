import 'package:flutter/material.dart';
import 'package:template/features/question/presentation/model/input_get_question.dart';
import 'package:template/shared/common/widget/custom_drop_down_menu.dart';
import 'package:template/shared/common/widget/text_filed_widget.dart';

import '../../../../shared/common/widget/button_widget.dart';
import '../../../../shared/resources/color_manager.dart';
import '../../../../shared/resources/font_manager.dart';
import '../../../../shared/resources/manager_values.dart';
import '../../../../shared/resources/styles_manager.dart';
import '../../data/models/question_model.dart';

class AddQuestionWidget extends StatefulWidget {
  final Question? model;

  const AddQuestionWidget({
    Key? key,
    this.model,
  }) : super(key: key);

  @override
  State<AddQuestionWidget> createState() => _AddQuestionWidgetState();
}

class _AddQuestionWidgetState extends State<AddQuestionWidget> {
  var nameController = TextEditingController();
  var descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Status questionStatus = Status.medium;

  @override
  void initState() {
    if (widget.model != null) {
      nameController.text = widget.model!.name;
      descriptionController.text = widget.model!.example;
      questionStatus = Status.values.firstWhere(
        (element) => element.name == widget.model!.status,
        orElse: () => Status.medium,
      );
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
                  'Add Question',
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
          CustomTextField(hintText: 'Name', controller: nameController),
          const SizedBox(height: AppSize.s16),
          CustomTextField(
            hintText: 'Description',
            controller: descriptionController,
            maxLines: 5,
          ),
          const SizedBox(height: AppSize.s16),
          CustomDropdown(
            items: Status.values
                .asMap()
                .entries
                .map(
                  (item) => DropdownItem<String>(
                    value: item.value.name,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        item.value.name.toUpperCase(),
                        style: getRegularStyle(),
                      ),
                    ),
                  ),
                )
                .toList(),
            child: Text(
              questionStatus.name,
              style: getMediumStyle(color: ColorManager.black),
            ),
            onChange: (value) {
              questionStatus = Status.values.asMap()[value] ?? Status.medium;
              setState(() {});
            },
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
                      var model = Question(
                        example: descriptionController.text,
                        status: questionStatus.name,
                        id: widget.model?.id ??
                            '${DateTime.now().millisecondsSinceEpoch}',
                        name: nameController.text,
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
