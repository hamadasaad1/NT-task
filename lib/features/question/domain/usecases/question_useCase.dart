import 'dart:isolate';

import 'package:dartz/dartz.dart';

import '../../../../app/error/failure.dart';
import '../../../../app/usecase/base_usecase.dart';
import '../../data/models/question_model.dart';
import '../../presentation/model/input_get_question.dart';
import '../repositories/repository.dart';

class QuestionGetAllUseCase implements BaseUseCase<void, List<Question>> {
  final QuestionRepository _repository;

  QuestionGetAllUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, List<Question>>> execute(Void) async {
    return await _repository.getQuestions();
  }
}

class QuestionAddOrUpdateUseCase implements BaseUseCase<Question, void> {
  final QuestionRepository _repository;

  QuestionAddOrUpdateUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, void>> execute(Question model) async {
    return await _repository.addOrUpdateQuestion(model);
  }
}

class QuestionDeleteUseCase implements BaseUseCase<String, void> {
  final QuestionRepository _repository;

  QuestionDeleteUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, void>> execute(String id) async {
    return await _repository.deleteQuestion(id);
  }
}

class QuestionListLocalAddOrUpdateUseCase
    implements BaseUseCase<void, List<Question>> {
  final QuestionRepository _repository;

  QuestionListLocalAddOrUpdateUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, List<Question>>> execute(Void) async {
    return await _repository.getAddOrUpdatedQuestions();
  }
}

class QuestionListLocalDeleteUseCase
    implements BaseUseCase<void, List<String>> {
  final QuestionRepository _repository;

  QuestionListLocalDeleteUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, List<String>>> execute(Void) async {
    return await _repository.getDeletedQuestions();
  }
}

class QuestionListLocalDeleteAllUseCase implements BaseUseCase<void, void> {
  final QuestionRepository _repository;

  QuestionListLocalDeleteAllUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, void>> execute(Void) async {
    return await _repository.deleteDeletedListQuestions();
  }
}

class QuestionListLocalDeleteAllUpdatedUseCase
    implements BaseUseCase<void, void> {
  final QuestionRepository _repository;

  QuestionListLocalDeleteAllUpdatedUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, void>> execute(Void) async {
    return await _repository.deleteUpdatedListQuestions();
  }
}

class QuestionSearchUseCase
    implements BaseUseCase<InputGetQuestion, List<Question>> {
  final QuestionRepository _repository;

  QuestionSearchUseCase(this._repository);

  @override
  Future<Either<Failure, List<Question>>> execute(
      InputGetQuestion input) async {
    // Fetch questions on the main thread first
    final Either<Failure, List<Question>> questionsResult =
        await _repository.getQuestions();

    // If the repository call failed, return the failure
    if (questionsResult.isLeft()) {
      return Left(questionsResult.swap().getOrElse(
          () => Failure(message: "Failed to fetch questions", code: 1)));
    }

    // If successful, pass the fetched questions and input to the Isolate for filtering
    final List<Question> questions = questionsResult.getOrElse(() => []);
    return await _searchInIsolate(questions, input);
  }

  Future<Either<Failure, List<Question>>> _searchInIsolate(
      List<Question> questions, InputGetQuestion input) async {
    final receivePort = ReceivePort();

    // Spawning the isolate to handle the filtering task
    await Isolate.spawn(
        _isolateSearch, [receivePort.sendPort, questions, input]);

    // Wait for the isolate to send back the filtered list of questions
    final result = await receivePort.first;

    // Handle the result
    if (result is Map<String, dynamic>) {
      if (result['status'] == 'success') {
        List<Question> filteredQuestions = result['data'];
        return Right(
            filteredQuestions); // Return the filtered questions wrapped in Right
      } else if (result['status'] == 'failure') {
        return Left(
            Failure(message: result['message'] ?? 'Filtering failed', code: 1));
      }
    }

    // Return a failure if the result is not as expected
    return Left(Failure(message: "Unexpected result type", code: 2));
  }

  // This method will run in the isolate
  static void _isolateSearch(List<dynamic> args) {
    SendPort sendPort = args[0];
    List<Question> questions = args[1]; // Fetched questions
    InputGetQuestion input = args[2]; // Input search criteria

    try {
      // Perform the search logic on the list of questions
      List<Question> filteredQuestions = questions.where((question) {
        // Check if input name is provided and matches
        final matchesName = input.name == null ||
            input.name!.isEmpty ||
            question.name.toLowerCase().contains(input.name!.toLowerCase());

        // Check if input status is provided and matches
        final matchesStatus = input.status == null ||
            question.status.toLowerCase() ==
                (input.status?.name ?? '').toLowerCase();

        // Return true if name matches and if status is either null or matches
        return matchesName && (input.status == null || matchesStatus);
      }).toList();

      // Send the result back to the main thread as Either type
      sendPort.send({
        'status': 'success',
        'data': filteredQuestions,
      });
    } catch (e) {
      // In case of failure, send a failure response
      sendPort.send({
        'status': 'failure',
        'message': 'Error occurred during filtering',
      });
    }
  }
}
