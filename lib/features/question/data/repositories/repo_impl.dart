import 'dart:ffi';
import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../app/error/error_handler.dart';
import '../../../../app/error/failure.dart';
import '../../../../app/network/network_info.dart';
import '../../domain/repositories/repository.dart';
import '../datasources/question_local_data_source.dart';
import '../datasources/question_remote_data_source.dart';
import '../models/question_model.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  final QuestionRemoteDataSource _remoteDataSource;
  final QuestionLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  QuestionRepositoryImpl(
      this._remoteDataSource, this._localDataSource, this._networkInfo);

  @override
  Future<Either<Failure, void>> deleteQuestion(String questionId) async {
    if (await _networkInfo.isConnected) {
      try {
        await _remoteDataSource.deleteQuestion(questionId);
        return const Right(Void);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      try {
        await _localDataSource.saveDeleteItemQuestion(questionId);
        await _localDataSource.deleteItemFromAllSaved(questionId);
        await _localDataSource.deleteItemFromAllUpdated(questionId);

        return const Right(Void);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    }
  }

  @override
  Future<Either<Failure, List<Question>>> getQuestions() async {
    if (await _networkInfo.isConnected) {
      try {
        final remoteQuestions = await _remoteDataSource.getQuestions();
        await _localDataSource.saveAllQuestions(remoteQuestions);
        return Right(remoteQuestions);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      try {
        final localQuestions = await _localDataSource.getAllQuestions();
        return Right(localQuestions);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    }
  }

  @override
  Future<Either<Failure, void>> addOrUpdateQuestion(Question question) async {
    if (await _networkInfo.isConnected) {
      try {
        await _remoteDataSource.addOrUpdateQuestion(question);
        return const Right(Void);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      try {
        await _localDataSource.saveOrUpdateQuestion(question);
        await _localDataSource.saveToAllQuestions(question);
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
  Future<Either<Failure, void>> deleteDeletedListQuestions() async {
    try {
      final delete = await _localDataSource.deleteListDeletedItemQuestions();
      return Right(delete);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, void>> deleteUpdatedListQuestions() async {
    try {
      final delete = await _localDataSource.deleteUpdatedListQuestions();
      return Right(delete);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<Question>>> getAddOrUpdatedQuestions() async {
    try {
      final items = await _localDataSource.getAddOrUpdatedQuestions();
      return Right(items);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<String>>> getDeletedQuestions() async {
    try {
      final items = await _localDataSource.getDeletedQuestions();
      return Right(items);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, List<Question>>> getSearchQuestions(
      {String? name, String? status}) async {
    if (await _networkInfo.isConnected) {
      try {
        final remoteQuestions = await _remoteDataSource.getSearchQuestions(
            name: name, status: status);
        return Right(remoteQuestions);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      try {
        final localQuestions = await _localDataSource.getSearchQuestions(
            name: name, status: status);
        return Right(localQuestions);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    }
  }
}
