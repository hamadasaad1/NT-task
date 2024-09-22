import 'package:flutter/material.dart';
import 'package:template/features/question/presentation/pages/question_details.dart';
import 'package:template/shared/common/widget/component.dart';

import '../../../../shared/common/widget/custom_image_widget.dart';
import '../../../../shared/resources/assets_manager.dart';
import '../../../../shared/resources/color_manager.dart';
import '../../../../shared/resources/manager_values.dart';
import '../../../../shared/resources/styles_manager.dart';
import '../../data/models/question_model.dart';

class QuestionListItemWidget extends StatelessWidget {
  final Question model;
  final Function onEdit;
  final Function onDelete;

  const QuestionListItemWidget({
    Key? key,
    required this.model,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildItemList(context);
  }

  Widget buildItemList(context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s8)),
        shadows: const [
          BoxShadow(
            color: ColorManager.shadowColor,
            blurRadius: 10,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: InkWell(
        onTap: () {
          changeNavigator(context, QuestionDetailPage(model: model));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text(model.name, style: getBoldStyle())),
                InkWell(
                  onTap: () => onEdit(),
                  child: CustomSvgImage(
                    imageName: Assets.assetsSvgEdit,
                    height: 20,
                    width: 20,
                  ),
                ),
                const SizedBox(
                  width: AppSize.s16,
                ),
                InkWell(
                  onTap: () => onDelete(),
                  child: CustomSvgImage(
                    imageName: Assets.assetsSvgDeleteIcon,
                    height: 20,
                    width: 20,
                    color: ColorManager.redColor,
                  ),
                ),
              ],
            ),
            Text(model.status.toUpperCase(), style: getRegularStyle()),
          ],
        ),
      ),
    );
  }
}
