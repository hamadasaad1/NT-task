import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../app/error/failure.dart';
import '../../../../app/service_locator.dart';
import '../../data/models/travel_destination.dart';
import '../../domain/usecases/travel_useCase.dart';

part 'travel_state.dart';

class TravelCubit extends Cubit<TravelState> {
  TravelCubit() : super(TravelInitial());

  final TravelGetAllUseCase _getAllUseCase = locator<TravelGetAllUseCase>();
  final TravelAddOrUpdateUseCase _addUseCase =
      locator<TravelAddOrUpdateUseCase>();
  final TravelDeleteUseCase _deleteUseCase = locator<TravelDeleteUseCase>();

  final TravelListLocalDeleteAllUpdatedUseCase
      _listLocalDeleteAllUpdatedUseCase =
      locator<TravelListLocalDeleteAllUpdatedUseCase>();
  final TravelListLocalDeleteAllUseCase _listLocalDeleteAllUseCase =
      locator<TravelListLocalDeleteAllUseCase>();

  final TravelListLocalAddOrUpdateUseCase _listLocalAddOrUpdateUseCase =
      locator<TravelListLocalAddOrUpdateUseCase>();
  final TravelListLocalDeleteUseCase _localDeleteUseCase =
      locator<TravelListLocalDeleteUseCase>();

  void getAllTravel() async {
    emit(TravelLoadingState());
    (await _getAllUseCase.execute(Void)).fold((failure) {
      return {
        emit(TravelErrorState(failure: failure)),
      };
    }, (data) {
      emit(TravelSuccessState(entity: data));
    });
  }

  void addOrUpdateTravel({required TravelDestination model}) async {
    emit(TravelAddLoadingState());
    (await _addUseCase.execute(model)).fold((failure) {
      return {
        emit(TravelAddErrorState(failure: failure)),
      };
    }, (data) {
      getAllTravel();
      emit(TravelAddSuccessState());
    });
  }

  void deleteTravel({required String id}) async {
    emit(TravelDeleteLoadingState());
    (await _deleteUseCase.execute(id)).fold((failure) {
      return {
        emit(TravelDeleteErrorState(failure: failure)),
      };
    }, (data) {
      getAllTravel();
      emit(TravelDeleteSuccessState());
    });
  }

  void deleteAllLocalDeletedItems() async {
    (await _listLocalDeleteAllUseCase.execute(Void)).fold((failure) {
      {
        debugPrint(failure.message);
      }
    }, (data) {
      debugPrint('deleteAllLocalDeletedItems');
    });
  }

  void deleteAllLocalUpdatedItems() async {
    (await _listLocalDeleteAllUpdatedUseCase.execute(Void)).fold((failure) {
      {
        debugPrint(failure.message);
      }
    }, (data) {
      debugPrint('deleteAllLocalUpdatedItems');
    });
  }

  void getAddOrUpdateListLocalAddUploadToFirebase() async {
    (await _listLocalAddOrUpdateUseCase.execute(Void)).fold((failure) {
      {
        debugPrint(failure.message);
      }
    }, (data) async {
      if (data.isNotEmpty) {
        for (var item in data) {
          await uploadToFirebaseWhenOnline(item);
        }
        getAllTravel();
        deleteAllLocalUpdatedItems();
      }
    });
  }

  void getDeletedListLocalAndUploadToFirebase() async {
    (await _localDeleteUseCase.execute(Void)).fold((failure) {
      {
        debugPrint(failure.message);
      }
    }, (data) async {
      if (data.isNotEmpty) {
        for (var item in data) {
          await deleteFromFirebaseWhenOnline(item);
        }
        getAllTravel();
        deleteAllLocalDeletedItems();
      }
    });
  }

  uploadToFirebaseWhenOnline(model) async {
    (await _addUseCase.execute(model)).fold((failure) {
      {
        debugPrint(failure.message);
      }
    }, (data) {
      debugPrint('uploadToFirebaseWhenOnline');
    });
  }

  deleteFromFirebaseWhenOnline(String id) async {
    (await _deleteUseCase.execute(id)).fold((failure) {
      {
        debugPrint(failure.message);
      }
    }, (data) {
      debugPrint('deleteFromFirebaseWhenOnline');
    });
  }

  void checkDataWhenOnline() async {
    getAddOrUpdateListLocalAddUploadToFirebase();

    getDeletedListLocalAndUploadToFirebase();
  }
}
