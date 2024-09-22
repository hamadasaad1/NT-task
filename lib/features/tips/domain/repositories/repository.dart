import 'package:dartz/dartz.dart';

import '../../../../app/error/failure.dart';
import '../../data/models/tips_model.dart';

abstract class TipRepository {
  // Fetch all interview tips
  Future<Either<Failure, List<Tip>>> getTips();

  // Search tips based on content
  Future<Either<Failure, List<Tip>>> getSearchTips({
    String? content,
  });

  // Add or update a tip in the repository
  Future<Either<Failure, void>> addOrUpdateTip(Tip tip);

  // Delete a tip by its ID
  Future<Either<Failure, void>> deleteTip(String tipId);
}
