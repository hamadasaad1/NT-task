import 'package:flutter/material.dart';
import 'package:template/shared/common/widget/text_filed_widget.dart';

import '../../../../app/singlton.dart';
import '../../../../shared/common/widget/button_widget.dart';
import '../../../../shared/resources/font_manager.dart';
import '../../../../shared/resources/manager_values.dart';
import '../../../../shared/resources/styles_manager.dart';
import '../../data/models/travel_destination.dart';

class AddTravelWidget extends StatefulWidget {
  final TravelDestination? model;

  const AddTravelWidget({
    Key? key,
    this.model,
  }) : super(key: key);

  @override
  State<AddTravelWidget> createState() => _AddTravelWidgetState();
}

class _AddTravelWidgetState extends State<AddTravelWidget> {
  var nameController = TextEditingController();
  var descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.model != null) {
      nameController.text = widget.model!.name;
      descriptionController.text = widget.model!.description;
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Text(
                  'Add Travel',
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
                      var model = TravelDestination(
                        createdBy: Singleton().userModel?.uid ?? '',
                        description: descriptionController.text,
                        id: widget.model?.id ??
                            '${DateTime.now().millisecondsSinceEpoch}',
                        imageUrl: widget.model?.id ?? '',
                        name: nameController.text,
                        permissions: Permissions(
                            read: widget.model?.permissions.read ?? true,
                            write: widget.model?.permissions.write ?? false,
                            deleteItem:
                                widget.model?.permissions.deleteItem ?? false),
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
