part of 'travel_cubit.dart';

abstract class TravelState extends Equatable {
  const TravelState();

  @override
  List<Object> get props => [];
}

class TravelInitial extends TravelState {}

class TravelLoadingState extends TravelState {}

class TravelSuccessState extends TravelState {
  final List<TravelDestination> entity;

  const TravelSuccessState({
    required this.entity,
  });
}

class TravelErrorState extends TravelState {
  final Failure failure;

  const TravelErrorState({
    required this.failure,
  });
}

class TravelAddLoadingState extends TravelState {}

class TravelAddSuccessState extends TravelState {}

class TravelAddErrorState extends TravelState {
  final Failure failure;

  const TravelAddErrorState({
    required this.failure,
  });
}

class TravelDeleteLoadingState extends TravelState {}

class TravelDeleteSuccessState extends TravelState {}

class TravelDeleteErrorState extends TravelState {
  final Failure failure;

  const TravelDeleteErrorState({
    required this.failure,
  });
}
