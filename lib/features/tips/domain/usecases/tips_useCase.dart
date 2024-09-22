import 'package:dartz/dartz.dart';

import '../../../../app/error/failure.dart';
import '../../../../app/usecase/base_usecase.dart';
import '../../data/models/tips_model.dart';
import '../repositories/repository.dart'; // Updated to use Tip model

class TipGetAllUseCase implements BaseUseCase<void, List<Tip>> {
  // Renamed to TipGetAllUseCase
  final TipRepository _repository;

  TipGetAllUseCase(this._repository);

  @override
  Future<Either<Failure, List<Tip>>> execute(Void) async {
    // Updated to return List<Tip>
    return await _repository.getTips(); // Updated method to get tips
  }
}

class TipAddOrUpdateUseCase implements BaseUseCase<Tip, void> {
  // Renamed to TipAddOrUpdateUseCase
  final TipRepository _repository;

  TipAddOrUpdateUseCase(this._repository);

  @override
  Future<Either<Failure, void>> execute(Tip model) async {
    // Updated to accept Tip
    return await _repository
        .addOrUpdateTip(model); // Updated method to add or update tips
  }
}

class TipDeleteUseCase implements BaseUseCase<String, void> {
  // Renamed to TipDeleteUseCase
  final TipRepository _repository;

  TipDeleteUseCase(this._repository);

  @override
  Future<Either<Failure, void>> execute(String id) async {
    // Updated to delete Tip by ID
    return await _repository.deleteTip(id); // Updated method to delete tips
  }
}
