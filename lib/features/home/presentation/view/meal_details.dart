import 'package:flutter/material.dart';
import 'package:template/features/home/domain/model/meal_entity.dart';
import 'package:template/shared/common/widget/custom_image_widget.dart';
import 'package:template/shared/resources/font_manager.dart';
import 'package:template/shared/resources/manager_values.dart';
import 'package:template/shared/resources/size_config.dart';

class MealDetailPage extends StatelessWidget {
  final MealEntity meal;

  MealDetailPage({required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: getPadding(all: AppPadding.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomNetworkImageWidget(
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              imageName: meal.image,
            ),
            const SizedBox(height: 16),
            Text(
              'Description:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              meal.description,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            Text(
              'Ingredients:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: meal.ingredients
                  .map<Widget>((ingredient) => Text(
                        '• $ingredient',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontSize: FontSize.s14),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 16),
            Text(
              'Deliverable Ingredients:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: meal.deliverableIngredients
                  .map<Widget>((step) => Text(
                        '• $step',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontSize: FontSize.s14),
                      ))
                  .toList(),
            ),
            const SizedBox(height: AppPadding.p16),
          ],
        ),
      ),
    );
  }
}
