import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app/error/failure.dart';
import '../../data/models/question_model.dart';

part 'question_state.freezed.dart';

@freezed
class QuestionState with _$QuestionState {
  const factory QuestionState.initial() = QuestionInitial;
  const factory QuestionState.loading() = QuestionLoadingState;
  const factory QuestionState.success(List<Question> entity) =
      QuestionSuccessState;
  const factory QuestionState.error(Failure failure) = QuestionErrorState;
  const factory QuestionState.addLoading() = QuestionAddLoadingState;
  const factory QuestionState.addSuccess() = QuestionAddSuccessState;
  const factory QuestionState.addError(Failure failure) = QuestionAddErrorState;
  const factory QuestionState.deleteLoading() = QuestionDeleteLoadingState;
  const factory QuestionState.deleteSuccess() = QuestionDeleteSuccessState;
  const factory QuestionState.deleteError(Failure failure) =
      QuestionDeleteErrorState;
}
