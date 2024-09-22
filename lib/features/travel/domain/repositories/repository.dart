import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../app/error/failure.dart';
import '../../data/models/travel_destination.dart';

abstract class TravelRepository {
  Future<Either<Failure, List<TravelDestination>>> getTravelDestinations();

  Future<Either<Failure, void>> addOrUpdateTravelDestination(
      TravelDestination destination);

  Future<Either<Failure, void>> deleteTravelDestination(String destinationId);

  Future<Either<Failure, String>> uploadImage(File image);

  Future<Either<Failure, List<TravelDestination>>>
      getAddOrUpdatedTravelDestinations();

  Future<Either<Failure, List<String>>> getDeletedTravelDestinations();

  Future<Either<Failure, void>> deleteUpdatedListTravel();

  Future<Either<Failure, void>> deleteListDeletedItemTravel();
}
