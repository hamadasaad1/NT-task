import 'dart:ffi';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/service_locator.dart';
import '../../data/models/tips_model.dart'; // Ensure this model is defined for tips
import '../../domain/usecases/tips_useCase.dart';
import 'tips_state.dart'; // Ensure this use case file has the appropriate Tip use cases

class TipNotifier extends StateNotifier<TipState> {
  // Renamed to TipNotifier
  TipNotifier() : super(const TipState.initial());

  final TipGetAllUseCase _getAllUseCase =
      locator<TipGetAllUseCase>(); // Updated to use Tip use case
  final TipAddOrUpdateUseCase _addUseCase = locator<
      TipAddOrUpdateUseCase>(); // Updated to use Tip add/update use case
  final TipDeleteUseCase _deleteUseCase =
      locator<TipDeleteUseCase>(); // Updated to use Tip delete use case
  final _tips = [
    Tip(id: '1', content: 'Be confident in your abilities.'),
    Tip(
        id: '2',
        content: 'Practice common interview questions.',
        advancedStrategy: 'Use the STAR method to structure your answers.'),
    Tip(id: '3', content: 'Research the company beforehand.'),
    Tip(id: '4', content: 'Dress appropriately for the interview.'),
    Tip(id: '5', content: 'Prepare questions to ask the interviewer.'),
    Tip(id: '6', content: 'Arrive on time or a few minutes early.'),
    Tip(
        id: '7',
        content: 'Make a good first impression with a firm handshake.'),
    Tip(id: '8', content: 'Listen carefully to the interviewer\'s questions.'),
    Tip(
        id: '9',
        content: 'Follow up with a thank-you email after the interview.'),
    Tip(id: '10', content: 'Be honest about your experiences and skills.')
  ];

  void init() {
    for (var element in _tips) {
      addOrUpdateTip(model: element);
    }

    getAllTips();
  }

  Future<void> getAllTips() async {
    // Renamed to getAllTips
    state = const TipState.loading(); // Updated to use TipState
    final result = await _getAllUseCase.execute(Void);
    result.fold(
      (failure) =>
          state = TipState.error(failure.message), // Updated to use TipState
      (data) => state = TipState.success(data), // Updated to use TipState
    );
  }

  Future<void> addOrUpdateTip({required Tip model}) async {
    // Renamed to addOrUpdateTip
    state = const TipState.addLoading(); // Updated to use TipState
    final result = await _addUseCase.execute(model);
    result.fold(
      (failure) =>
          state = TipState.addError(failure.message), // Updated to use TipState
      (data) {
        getAllTips(); // Call the updated method
        state = const TipState.addSuccess(); // Updated to use TipState
      },
    );
  }

  Future<void> deleteTip({required String id}) async {
    // Renamed to deleteTip
    state = const TipState.deleteLoading(); // Updated to use TipState
    final result = await _deleteUseCase.execute(id);
    result.fold(
      (failure) => state =
          TipState.deleteError(failure.message), // Updated to use TipState
      (data) {
        getAllTips(); // Call the updated method
        state = const TipState.deleteSuccess(); // Updated to use TipState
      },
    );
  }
}

final tipNotifierProvider = StateNotifierProvider<TipNotifier, TipState>(
  // Renamed to tipNotifierProvider
  (ref) {
    final tipNotifier = TipNotifier(); // Updated to create TipNotifier
    tipNotifier.getAllTips(); // Fetch all tips on initialization
    return tipNotifier;
  },
);
