import 'package:flutter/material.dart';
import 'package:template/shared/resources/manager_values.dart';
import 'package:template/shared/resources/size_config.dart';

import '../../../../utils.dart';
import '../../data/models/question_model.dart';

class QuestionDetailPage extends StatelessWidget {
  final Question model; // Pass the selected question

  const QuestionDetailPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question Details'),
      ),
      body: Padding(
        padding: getPadding(all: AppPadding.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Question:',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  model.status.toUpperCase(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Utils().createHero(
              tag: 'question_${model.id}', // Matching tag with the list
              child: Text(
                model.name, // Question name
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Example:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              model.example, // Question name
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
