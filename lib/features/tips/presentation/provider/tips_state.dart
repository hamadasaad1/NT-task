import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/tips_model.dart'; // Import your Tip model here

part 'tips_state.freezed.dart';

@freezed
class TipState with _$TipState {
  const factory TipState.initial() =
      _Initial; // Initial state when the notifier is created
  const factory TipState.loading() =
      _Loading; // Loading state while fetching data
  const factory TipState.success(List<Tip> tips) =
      _Success; // Success state containing the list of tips
  const factory TipState.error(String message) =
      _Error; // Error state with an error message

  const factory TipState.addLoading() =
      _AddLoading; // Loading state while adding/updating a tip
  const factory TipState.addSuccess() =
      _AddSuccess; // Success state after adding/updating a tip
  const factory TipState.addError(String message) =
      _AddError; // Error state when adding/updating a tip

  const factory TipState.deleteLoading() =
      _DeleteLoading; // Loading state while deleting a tip
  const factory TipState.deleteSuccess() =
      _DeleteSuccess; // Success state after deleting a tip
  const factory TipState.deleteError(String message) =
      _DeleteError; // Error state when deleting a tip
}
