import 'dart:ffi';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:template/features/travel/data/datasources/travel_remote_data_source.dart';
import 'package:template/features/travel/data/models/travel_destination.dart';
import 'package:template/features/travel/domain/repositories/repository.dart';

import '../../../../app/error/error_handler.dart';
import '../../../../app/error/failure.dart';
import '../../../../app/network/network_info.dart';
import '../datasources/travel_local_data_source.dart';

class TraveRepositoryImpl implements TravelRepository {
  final TravelRemoteDataSource _remoteDataSource;
  final TravelLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  TraveRepositoryImpl(
      this._remoteDataSource, this._localDataSource, this._networkInfo);

  @override
  Future<Either<Failure, void>> deleteTravelDestination(
      String destinationId) async {
    if (await _networkInfo.isConnected) {
      try {
        await _remoteDataSource.deleteTravelDestination(destinationId);
        return const Right(Void);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      try {
        await _localDataSource.saveDeleteItemTravelDestination(destinationId);
        await _localDataSource.deleteItemFormAllSaved(destinationId);
        await _localDataSource.deleteItemFormAllUpdated(destinationId);

        return Right(Void);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    }
  }

  @override
  Future<Either<Failure, List<TravelDestination>>>
      getTravelDestinations() async {
    if (await _networkInfo.isConnected) {
      try {
        final remoteTravelDestination =
            await _remoteDataSource.getTravelDestinations();
        _localDataSource.saveAllTravelDestinations(remoteTravelDestination);
        return Right(remoteTravelDestination);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      try {
        final localTravelDestination =
            await _localDataSource.getAllTravelDestinations();
        return Right(localTravelDestination);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    }
  }

  @override
  Future<Either<Failure, void>> addOrUpdateTravelDestination(
      TravelDestination destination) async {
    if (await _networkInfo.isConnected) {
      try {
        await _remoteDataSource.addOrUpdateTravelDestination(destination);
        return const Right(Void);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      try {
        await _localDataSource.saveOrUpdateTravelDestination(destination);
        await _localDataSource.saveToAllTravelDestination(destination);
        return const Right(Void);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    }
  }

  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    if (await _networkInfo.isConnected) {
      try {
        final imageUrl = await _remoteDataSource.uploadImage(image);
        return Right(imageUrl);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteListDeletedItemTravel() async {
    try {
      final delete = await _localDataSource.deleteListDeletedItemTravel();
      return Right(delete);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, void>> deleteUpdatedListTravel() async {
    try {
      final delete = await _localDataSource.deleteUpdatedListTravel();
      return Right(delete);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<TravelDestination>>>
      getAddOrUpdatedTravelDestinations() async {
    try {
      final items = await _localDataSource.getAddOrUpdatedTravelDestinations();
      return Right(items);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<String>>> getDeletedTravelDestinations() async {
    try {
      final items = await _localDataSource.getDeletedTravelDestinations();
      return Right(items);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
