import 'package:dartz/dartz.dart';
import 'package:template/features/travel/domain/repositories/repository.dart';

import '../../../../app/error/failure.dart';
import '../../../../app/usecase/base_usecase.dart';
import '../../data/models/travel_destination.dart';

class TravelGetAllUseCase
    implements BaseUseCase<void, List<TravelDestination>> {
  final TravelRepository _repository;

  TravelGetAllUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, List<TravelDestination>>> execute(Void) async {
    return await _repository.getTravelDestinations();
  }
}

class TravelAddOrUpdateUseCase implements BaseUseCase<TravelDestination, void> {
  final TravelRepository _repository;

  TravelAddOrUpdateUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, void>> execute(TravelDestination model) async {
    return await _repository.addOrUpdateTravelDestination(model);
  }
}

class TravelDeleteUseCase implements BaseUseCase<String, void> {
  final TravelRepository _repository;

  TravelDeleteUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, void>> execute(String id) async {
    return await _repository.deleteTravelDestination(id);
  }
}

class TravelListLocalAddOrUpdateUseCase
    implements BaseUseCase<void, List<TravelDestination>> {
  final TravelRepository _repository;

  TravelListLocalAddOrUpdateUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, List<TravelDestination>>> execute(Void) async {
    return await _repository.getAddOrUpdatedTravelDestinations();
  }
}

class TravelListLocalDeleteUseCase implements BaseUseCase<void, List<String>> {
  final TravelRepository _repository;

  TravelListLocalDeleteUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, List<String>>> execute(Void) async {
    return await _repository.getDeletedTravelDestinations();
  }
}

class TravelListLocalDeleteAllUseCase implements BaseUseCase<void, void> {
  final TravelRepository _repository;

  TravelListLocalDeleteAllUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, void>> execute(Void) async {
    return await _repository.deleteListDeletedItemTravel();
  }
}

class TravelListLocalDeleteAllUpdatedUseCase
    implements BaseUseCase<void, void> {
  final TravelRepository _repository;

  TravelListLocalDeleteAllUpdatedUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, void>> execute(Void) async {
    return await _repository.deleteUpdatedListTravel();
  }
}
