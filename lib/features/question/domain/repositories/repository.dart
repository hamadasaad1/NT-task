import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../app/error/failure.dart';
import '../../data/models/question_model.dart';

abstract class QuestionRepository {
  // Fetch all interview questions
  Future<Either<Failure, List<Question>>> getQuestions();
  Future<Either<Failure, List<Question>>> getSearchQuestions({
    String? name,
    String? status,
  });

  // Add or update a question in the repository
  Future<Either<Failure, void>> addOrUpdateQuestion(Question question);

  // Delete a question by its ID
  Future<Either<Failure, void>> deleteQuestion(String questionId);

  // Upload an image and get the download URL
  Future<Either<Failure, String>> uploadImage(File image);

  // Get the list of added or updated interview questions
  Future<Either<Failure, List<Question>>> getAddOrUpdatedQuestions();

  // Get the list of deleted interview questions
  Future<Either<Failure, List<String>>> getDeletedQuestions();

  // Delete the list of updated questions
  Future<Either<Failure, void>> deleteUpdatedListQuestions();

  // Delete the list of deleted questions
  Future<Either<Failure, void>> deleteDeletedListQuestions();
}
