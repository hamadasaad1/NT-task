import 'dart:ffi';

import 'package:dartz/dartz.dart';

import '../../../../app/error/error_handler.dart';
import '../../../../app/error/failure.dart';
import '../../domain/repositories/repository.dart';
import '../datasources/tips_local_data_source.dart';
import '../models/tips_model.dart';

class TipRepositoryImpl implements TipRepository {
  // Renamed to TipRepositoryImpl

  final TipLocalDataSource _localDataSource;

  TipRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, void>> deleteTip(String tipId) async {
    try {
      await _localDataSource.deleteTip(tipId);

      return const Right(Void);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<Tip>>> getTips() async {
    // Updated to fetch Tips

    try {
      final localTips =
          await _localDataSource.getAllTips(); // Fetching Tips from local
      return Right(localTips);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, void>> addOrUpdateTip(Tip tip) async {
    // Updated to add or update Tips

    try {
      await _localDataSource.saveOrUpdateTip(tip); // Save or update Tip locally
      await _localDataSource.saveToAllTips(tip); // Save Tip to all Tips
      return const Right(Void);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<Tip>>> getSearchTips({String? content}) async {
    try {
      final localTips = await _localDataSource.getSearchTips(
          content: content); // Fetching Tips from local
      return Right(localTips);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
