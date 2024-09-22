// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QuestionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Question> entity) success,
    required TResult Function(Failure failure) error,
    required TResult Function() addLoading,
    required TResult Function() addSuccess,
    required TResult Function(Failure failure) addError,
    required TResult Function() deleteLoading,
    required TResult Function() deleteSuccess,
    required TResult Function(Failure failure) deleteError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Question> entity)? success,
    TResult? Function(Failure failure)? error,
    TResult? Function()? addLoading,
    TResult? Function()? addSuccess,
    TResult? Function(Failure failure)? addError,
    TResult? Function()? deleteLoading,
    TResult? Function()? deleteSuccess,
    TResult? Function(Failure failure)? deleteError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Question> entity)? success,
    TResult Function(Failure failure)? error,
    TResult Function()? addLoading,
    TResult Function()? addSuccess,
    TResult Function(Failure failure)? addError,
    TResult Function()? deleteLoading,
    TResult Function()? deleteSuccess,
    TResult Function(Failure failure)? deleteError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuestionInitial value) initial,
    required TResult Function(QuestionLoadingState value) loading,
    required TResult Function(QuestionSuccessState value) success,
    required TResult Function(QuestionErrorState value) error,
    required TResult Function(QuestionAddLoadingState value) addLoading,
    required TResult Function(QuestionAddSuccessState value) addSuccess,
    required TResult Function(QuestionAddErrorState value) addError,
    required TResult Function(QuestionDeleteLoadingState value) deleteLoading,
    required TResult Function(QuestionDeleteSuccessState value) deleteSuccess,
    required TResult Function(QuestionDeleteErrorState value) deleteError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuestionInitial value)? initial,
    TResult? Function(QuestionLoadingState value)? loading,
    TResult? Function(QuestionSuccessState value)? success,
    TResult? Function(QuestionErrorState value)? error,
    TResult? Function(QuestionAddLoadingState value)? addLoading,
    TResult? Function(QuestionAddSuccessState value)? addSuccess,
    TResult? Function(QuestionAddErrorState value)? addError,
    TResult? Function(QuestionDeleteLoadingState value)? deleteLoading,
    TResult? Function(QuestionDeleteSuccessState value)? deleteSuccess,
    TResult? Function(QuestionDeleteErrorState value)? deleteError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuestionInitial value)? initial,
    TResult Function(QuestionLoadingState value)? loading,
    TResult Function(QuestionSuccessState value)? success,
    TResult Function(QuestionErrorState value)? error,
    TResult Function(QuestionAddLoadingState value)? addLoading,
    TResult Function(QuestionAddSuccessState value)? addSuccess,
    TResult Function(QuestionAddErrorState value)? addError,
    TResult Function(QuestionDeleteLoadingState value)? deleteLoading,
    TResult Function(QuestionDeleteSuccessState value)? deleteSuccess,
    TResult Function(QuestionDeleteErrorState value)? deleteError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionStateCopyWith<$Res> {
  factory $QuestionStateCopyWith(
          QuestionState value, $Res Function(QuestionState) then) =
      _$QuestionStateCopyWithImpl<$Res, QuestionState>;
}

/// @nodoc
class _$QuestionStateCopyWithImpl<$Res, $Val extends QuestionState>
    implements $QuestionStateCopyWith<$Res> {
  _$QuestionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$QuestionInitialImplCopyWith<$Res> {
  factory _$$QuestionInitialImplCopyWith(_$QuestionInitialImpl value,
          $Res Function(_$QuestionInitialImpl) then) =
      __$$QuestionInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$QuestionInitialImplCopyWithImpl<$Res>
    extends _$QuestionStateCopyWithImpl<$Res, _$QuestionInitialImpl>
    implements _$$QuestionInitialImplCopyWith<$Res> {
  __$$QuestionInitialImplCopyWithImpl(
      _$QuestionInitialImpl _value, $Res Function(_$QuestionInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$QuestionInitialImpl implements QuestionInitial {
  const _$QuestionInitialImpl();

  @override
  String toString() {
    return 'QuestionState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$QuestionInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Question> entity) success,
    required TResult Function(Failure failure) error,
    required TResult Function() addLoading,
    required TResult Function() addSuccess,
    required TResult Function(Failure failure) addError,
    required TResult Function() deleteLoading,
    required TResult Function() deleteSuccess,
    required TResult Function(Failure failure) deleteError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Question> entity)? success,
    TResult? Function(Failure failure)? error,
    TResult? Function()? addLoading,
    TResult? Function()? addSuccess,
    TResult? Function(Failure failure)? addError,
    TResult? Function()? deleteLoading,
    TResult? Function()? deleteSuccess,
    TResult? Function(Failure failure)? deleteError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Question> entity)? success,
    TResult Function(Failure failure)? error,
    TResult Function()? addLoading,
    TResult Function()? addSuccess,
    TResult Function(Failure failure)? addError,
    TResult Function()? deleteLoading,
    TResult Function()? deleteSuccess,
    TResult Function(Failure failure)? deleteError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuestionInitial value) initial,
    required TResult Function(QuestionLoadingState value) loading,
    required TResult Function(QuestionSuccessState value) success,
    required TResult Function(QuestionErrorState value) error,
    required TResult Function(QuestionAddLoadingState value) addLoading,
    required TResult Function(QuestionAddSuccessState value) addSuccess,
    required TResult Function(QuestionAddErrorState value) addError,
    required TResult Function(QuestionDeleteLoadingState value) deleteLoading,
    required TResult Function(QuestionDeleteSuccessState value) deleteSuccess,
    required TResult Function(QuestionDeleteErrorState value) deleteError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuestionInitial value)? initial,
    TResult? Function(QuestionLoadingState value)? loading,
    TResult? Function(QuestionSuccessState value)? success,
    TResult? Function(QuestionErrorState value)? error,
    TResult? Function(QuestionAddLoadingState value)? addLoading,
    TResult? Function(QuestionAddSuccessState value)? addSuccess,
    TResult? Function(QuestionAddErrorState value)? addError,
    TResult? Function(QuestionDeleteLoadingState value)? deleteLoading,
    TResult? Function(QuestionDeleteSuccessState value)? deleteSuccess,
    TResult? Function(QuestionDeleteErrorState value)? deleteError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuestionInitial value)? initial,
    TResult Function(QuestionLoadingState value)? loading,
    TResult Function(QuestionSuccessState value)? success,
    TResult Function(QuestionErrorState value)? error,
    TResult Function(QuestionAddLoadingState value)? addLoading,
    TResult Function(QuestionAddSuccessState value)? addSuccess,
    TResult Function(QuestionAddErrorState value)? addError,
    TResult Function(QuestionDeleteLoadingState value)? deleteLoading,
    TResult Function(QuestionDeleteSuccessState value)? deleteSuccess,
    TResult Function(QuestionDeleteErrorState value)? deleteError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class QuestionInitial implements QuestionState {
  const factory QuestionInitial() = _$QuestionInitialImpl;
}

/// @nodoc
abstract class _$$QuestionLoadingStateImplCopyWith<$Res> {
  factory _$$QuestionLoadingStateImplCopyWith(_$QuestionLoadingStateImpl value,
          $Res Function(_$QuestionLoadingStateImpl) then) =
      __$$QuestionLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$QuestionLoadingStateImplCopyWithImpl<$Res>
    extends _$QuestionStateCopyWithImpl<$Res, _$QuestionLoadingStateImpl>
    implements _$$QuestionLoadingStateImplCopyWith<$Res> {
  __$$QuestionLoadingStateImplCopyWithImpl(_$QuestionLoadingStateImpl _value,
      $Res Function(_$QuestionLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$QuestionLoadingStateImpl implements QuestionLoadingState {
  const _$QuestionLoadingStateImpl();

  @override
  String toString() {
    return 'QuestionState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Question> entity) success,
    required TResult Function(Failure failure) error,
    required TResult Function() addLoading,
    required TResult Function() addSuccess,
    required TResult Function(Failure failure) addError,
    required TResult Function() deleteLoading,
    required TResult Function() deleteSuccess,
    required TResult Function(Failure failure) deleteError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Question> entity)? success,
    TResult? Function(Failure failure)? error,
    TResult? Function()? addLoading,
    TResult? Function()? addSuccess,
    TResult? Function(Failure failure)? addError,
    TResult? Function()? deleteLoading,
    TResult? Function()? deleteSuccess,
    TResult? Function(Failure failure)? deleteError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Question> entity)? success,
    TResult Function(Failure failure)? error,
    TResult Function()? addLoading,
    TResult Function()? addSuccess,
    TResult Function(Failure failure)? addError,
    TResult Function()? deleteLoading,
    TResult Function()? deleteSuccess,
    TResult Function(Failure failure)? deleteError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuestionInitial value) initial,
    required TResult Function(QuestionLoadingState value) loading,
    required TResult Function(QuestionSuccessState value) success,
    required TResult Function(QuestionErrorState value) error,
    required TResult Function(QuestionAddLoadingState value) addLoading,
    required TResult Function(QuestionAddSuccessState value) addSuccess,
    required TResult Function(QuestionAddErrorState value) addError,
    required TResult Function(QuestionDeleteLoadingState value) deleteLoading,
    required TResult Function(QuestionDeleteSuccessState value) deleteSuccess,
    required TResult Function(QuestionDeleteErrorState value) deleteError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuestionInitial value)? initial,
    TResult? Function(QuestionLoadingState value)? loading,
    TResult? Function(QuestionSuccessState value)? success,
    TResult? Function(QuestionErrorState value)? error,
    TResult? Function(QuestionAddLoadingState value)? addLoading,
    TResult? Function(QuestionAddSuccessState value)? addSuccess,
    TResult? Function(QuestionAddErrorState value)? addError,
    TResult? Function(QuestionDeleteLoadingState value)? deleteLoading,
    TResult? Function(QuestionDeleteSuccessState value)? deleteSuccess,
    TResult? Function(QuestionDeleteErrorState value)? deleteError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuestionInitial value)? initial,
    TResult Function(QuestionLoadingState value)? loading,
    TResult Function(QuestionSuccessState value)? success,
    TResult Function(QuestionErrorState value)? error,
    TResult Function(QuestionAddLoadingState value)? addLoading,
    TResult Function(QuestionAddSuccessState value)? addSuccess,
    TResult Function(QuestionAddErrorState value)? addError,
    TResult Function(QuestionDeleteLoadingState value)? deleteLoading,
    TResult Function(QuestionDeleteSuccessState value)? deleteSuccess,
    TResult Function(QuestionDeleteErrorState value)? deleteError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class QuestionLoadingState implements QuestionState {
  const factory QuestionLoadingState() = _$QuestionLoadingStateImpl;
}

/// @nodoc
abstract class _$$QuestionSuccessStateImplCopyWith<$Res> {
  factory _$$QuestionSuccessStateImplCopyWith(_$QuestionSuccessStateImpl value,
          $Res Function(_$QuestionSuccessStateImpl) then) =
      __$$QuestionSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Question> entity});
}

/// @nodoc
class __$$QuestionSuccessStateImplCopyWithImpl<$Res>
    extends _$QuestionStateCopyWithImpl<$Res, _$QuestionSuccessStateImpl>
    implements _$$QuestionSuccessStateImplCopyWith<$Res> {
  __$$QuestionSuccessStateImplCopyWithImpl(_$QuestionSuccessStateImpl _value,
      $Res Function(_$QuestionSuccessStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entity = null,
  }) {
    return _then(_$QuestionSuccessStateImpl(
      null == entity
          ? _value._entity
          : entity // ignore: cast_nullable_to_non_nullable
              as List<Question>,
    ));
  }
}

/// @nodoc

class _$QuestionSuccessStateImpl implements QuestionSuccessState {
  const _$QuestionSuccessStateImpl(final List<Question> entity)
      : _entity = entity;

  final List<Question> _entity;
  @override
  List<Question> get entity {
    if (_entity is EqualUnmodifiableListView) return _entity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entity);
  }

  @override
  String toString() {
    return 'QuestionState.success(entity: $entity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionSuccessStateImpl &&
            const DeepCollectionEquality().equals(other._entity, _entity));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_entity));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionSuccessStateImplCopyWith<_$QuestionSuccessStateImpl>
      get copyWith =>
          __$$QuestionSuccessStateImplCopyWithImpl<_$QuestionSuccessStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Question> entity) success,
    required TResult Function(Failure failure) error,
    required TResult Function() addLoading,
    required TResult Function() addSuccess,
    required TResult Function(Failure failure) addError,
    required TResult Function() deleteLoading,
    required TResult Function() deleteSuccess,
    required TResult Function(Failure failure) deleteError,
  }) {
    return success(entity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Question> entity)? success,
    TResult? Function(Failure failure)? error,
    TResult? Function()? addLoading,
    TResult? Function()? addSuccess,
    TResult? Function(Failure failure)? addError,
    TResult? Function()? deleteLoading,
    TResult? Function()? deleteSuccess,
    TResult? Function(Failure failure)? deleteError,
  }) {
    return success?.call(entity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Question> entity)? success,
    TResult Function(Failure failure)? error,
    TResult Function()? addLoading,
    TResult Function()? addSuccess,
    TResult Function(Failure failure)? addError,
    TResult Function()? deleteLoading,
    TResult Function()? deleteSuccess,
    TResult Function(Failure failure)? deleteError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(entity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuestionInitial value) initial,
    required TResult Function(QuestionLoadingState value) loading,
    required TResult Function(QuestionSuccessState value) success,
    required TResult Function(QuestionErrorState value) error,
    required TResult Function(QuestionAddLoadingState value) addLoading,
    required TResult Function(QuestionAddSuccessState value) addSuccess,
    required TResult Function(QuestionAddErrorState value) addError,
    required TResult Function(QuestionDeleteLoadingState value) deleteLoading,
    required TResult Function(QuestionDeleteSuccessState value) deleteSuccess,
    required TResult Function(QuestionDeleteErrorState value) deleteError,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuestionInitial value)? initial,
    TResult? Function(QuestionLoadingState value)? loading,
    TResult? Function(QuestionSuccessState value)? success,
    TResult? Function(QuestionErrorState value)? error,
    TResult? Function(QuestionAddLoadingState value)? addLoading,
    TResult? Function(QuestionAddSuccessState value)? addSuccess,
    TResult? Function(QuestionAddErrorState value)? addError,
    TResult? Function(QuestionDeleteLoadingState value)? deleteLoading,
    TResult? Function(QuestionDeleteSuccessState value)? deleteSuccess,
    TResult? Function(QuestionDeleteErrorState value)? deleteError,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuestionInitial value)? initial,
    TResult Function(QuestionLoadingState value)? loading,
    TResult Function(QuestionSuccessState value)? success,
    TResult Function(QuestionErrorState value)? error,
    TResult Function(QuestionAddLoadingState value)? addLoading,
    TResult Function(QuestionAddSuccessState value)? addSuccess,
    TResult Function(QuestionAddErrorState value)? addError,
    TResult Function(QuestionDeleteLoadingState value)? deleteLoading,
    TResult Function(QuestionDeleteSuccessState value)? deleteSuccess,
    TResult Function(QuestionDeleteErrorState value)? deleteError,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class QuestionSuccessState implements QuestionState {
  const factory QuestionSuccessState(final List<Question> entity) =
      _$QuestionSuccessStateImpl;

  List<Question> get entity;
  @JsonKey(ignore: true)
  _$$QuestionSuccessStateImplCopyWith<_$QuestionSuccessStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QuestionErrorStateImplCopyWith<$Res> {
  factory _$$QuestionErrorStateImplCopyWith(_$QuestionErrorStateImpl value,
          $Res Function(_$QuestionErrorStateImpl) then) =
      __$$QuestionErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class __$$QuestionErrorStateImplCopyWithImpl<$Res>
    extends _$QuestionStateCopyWithImpl<$Res, _$QuestionErrorStateImpl>
    implements _$$QuestionErrorStateImplCopyWith<$Res> {
  __$$QuestionErrorStateImplCopyWithImpl(_$QuestionErrorStateImpl _value,
      $Res Function(_$QuestionErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$QuestionErrorStateImpl(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$QuestionErrorStateImpl implements QuestionErrorState {
  const _$QuestionErrorStateImpl(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'QuestionState.error(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionErrorStateImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionErrorStateImplCopyWith<_$QuestionErrorStateImpl> get copyWith =>
      __$$QuestionErrorStateImplCopyWithImpl<_$QuestionErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Question> entity) success,
    required TResult Function(Failure failure) error,
    required TResult Function() addLoading,
    required TResult Function() addSuccess,
    required TResult Function(Failure failure) addError,
    required TResult Function() deleteLoading,
    required TResult Function() deleteSuccess,
    required TResult Function(Failure failure) deleteError,
  }) {
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Question> entity)? success,
    TResult? Function(Failure failure)? error,
    TResult? Function()? addLoading,
    TResult? Function()? addSuccess,
    TResult? Function(Failure failure)? addError,
    TResult? Function()? deleteLoading,
    TResult? Function()? deleteSuccess,
    TResult? Function(Failure failure)? deleteError,
  }) {
    return error?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Question> entity)? success,
    TResult Function(Failure failure)? error,
    TResult Function()? addLoading,
    TResult Function()? addSuccess,
    TResult Function(Failure failure)? addError,
    TResult Function()? deleteLoading,
    TResult Function()? deleteSuccess,
    TResult Function(Failure failure)? deleteError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuestionInitial value) initial,
    required TResult Function(QuestionLoadingState value) loading,
    required TResult Function(QuestionSuccessState value) success,
    required TResult Function(QuestionErrorState value) error,
    required TResult Function(QuestionAddLoadingState value) addLoading,
    required TResult Function(QuestionAddSuccessState value) addSuccess,
    required TResult Function(QuestionAddErrorState value) addError,
    required TResult Function(QuestionDeleteLoadingState value) deleteLoading,
    required TResult Function(QuestionDeleteSuccessState value) deleteSuccess,
    required TResult Function(QuestionDeleteErrorState value) deleteError,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuestionInitial value)? initial,
    TResult? Function(QuestionLoadingState value)? loading,
    TResult? Function(QuestionSuccessState value)? success,
    TResult? Function(QuestionErrorState value)? error,
    TResult? Function(QuestionAddLoadingState value)? addLoading,
    TResult? Function(QuestionAddSuccessState value)? addSuccess,
    TResult? Function(QuestionAddErrorState value)? addError,
    TResult? Function(QuestionDeleteLoadingState value)? deleteLoading,
    TResult? Function(QuestionDeleteSuccessState value)? deleteSuccess,
    TResult? Function(QuestionDeleteErrorState value)? deleteError,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuestionInitial value)? initial,
    TResult Function(QuestionLoadingState value)? loading,
    TResult Function(QuestionSuccessState value)? success,
    TResult Function(QuestionErrorState value)? error,
    TResult Function(QuestionAddLoadingState value)? addLoading,
    TResult Function(QuestionAddSuccessState value)? addSuccess,
    TResult Function(QuestionAddErrorState value)? addError,
    TResult Function(QuestionDeleteLoadingState value)? deleteLoading,
    TResult Function(QuestionDeleteSuccessState value)? deleteSuccess,
    TResult Function(QuestionDeleteErrorState value)? deleteError,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class QuestionErrorState implements QuestionState {
  const factory QuestionErrorState(final Failure failure) =
      _$QuestionErrorStateImpl;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$QuestionErrorStateImplCopyWith<_$QuestionErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QuestionAddLoadingStateImplCopyWith<$Res> {
  factory _$$QuestionAddLoadingStateImplCopyWith(
          _$QuestionAddLoadingStateImpl value,
          $Res Function(_$QuestionAddLoadingStateImpl) then) =
      __$$QuestionAddLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$QuestionAddLoadingStateImplCopyWithImpl<$Res>
    extends _$QuestionStateCopyWithImpl<$Res, _$QuestionAddLoadingStateImpl>
    implements _$$QuestionAddLoadingStateImplCopyWith<$Res> {
  __$$QuestionAddLoadingStateImplCopyWithImpl(
      _$QuestionAddLoadingStateImpl _value,
      $Res Function(_$QuestionAddLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$QuestionAddLoadingStateImpl implements QuestionAddLoadingState {
  const _$QuestionAddLoadingStateImpl();

  @override
  String toString() {
    return 'QuestionState.addLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionAddLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Question> entity) success,
    required TResult Function(Failure failure) error,
    required TResult Function() addLoading,
    required TResult Function() addSuccess,
    required TResult Function(Failure failure) addError,
    required TResult Function() deleteLoading,
    required TResult Function() deleteSuccess,
    required TResult Function(Failure failure) deleteError,
  }) {
    return addLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Question> entity)? success,
    TResult? Function(Failure failure)? error,
    TResult? Function()? addLoading,
    TResult? Function()? addSuccess,
    TResult? Function(Failure failure)? addError,
    TResult? Function()? deleteLoading,
    TResult? Function()? deleteSuccess,
    TResult? Function(Failure failure)? deleteError,
  }) {
    return addLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Question> entity)? success,
    TResult Function(Failure failure)? error,
    TResult Function()? addLoading,
    TResult Function()? addSuccess,
    TResult Function(Failure failure)? addError,
    TResult Function()? deleteLoading,
    TResult Function()? deleteSuccess,
    TResult Function(Failure failure)? deleteError,
    required TResult orElse(),
  }) {
    if (addLoading != null) {
      return addLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuestionInitial value) initial,
    required TResult Function(QuestionLoadingState value) loading,
    required TResult Function(QuestionSuccessState value) success,
    required TResult Function(QuestionErrorState value) error,
    required TResult Function(QuestionAddLoadingState value) addLoading,
    required TResult Function(QuestionAddSuccessState value) addSuccess,
    required TResult Function(QuestionAddErrorState value) addError,
    required TResult Function(QuestionDeleteLoadingState value) deleteLoading,
    required TResult Function(QuestionDeleteSuccessState value) deleteSuccess,
    required TResult Function(QuestionDeleteErrorState value) deleteError,
  }) {
    return addLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuestionInitial value)? initial,
    TResult? Function(QuestionLoadingState value)? loading,
    TResult? Function(QuestionSuccessState value)? success,
    TResult? Function(QuestionErrorState value)? error,
    TResult? Function(QuestionAddLoadingState value)? addLoading,
    TResult? Function(QuestionAddSuccessState value)? addSuccess,
    TResult? Function(QuestionAddErrorState value)? addError,
    TResult? Function(QuestionDeleteLoadingState value)? deleteLoading,
    TResult? Function(QuestionDeleteSuccessState value)? deleteSuccess,
    TResult? Function(QuestionDeleteErrorState value)? deleteError,
  }) {
    return addLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuestionInitial value)? initial,
    TResult Function(QuestionLoadingState value)? loading,
    TResult Function(QuestionSuccessState value)? success,
    TResult Function(QuestionErrorState value)? error,
    TResult Function(QuestionAddLoadingState value)? addLoading,
    TResult Function(QuestionAddSuccessState value)? addSuccess,
    TResult Function(QuestionAddErrorState value)? addError,
    TResult Function(QuestionDeleteLoadingState value)? deleteLoading,
    TResult Function(QuestionDeleteSuccessState value)? deleteSuccess,
    TResult Function(QuestionDeleteErrorState value)? deleteError,
    required TResult orElse(),
  }) {
    if (addLoading != null) {
      return addLoading(this);
    }
    return orElse();
  }
}

abstract class QuestionAddLoadingState implements QuestionState {
  const factory QuestionAddLoadingState() = _$QuestionAddLoadingStateImpl;
}

/// @nodoc
abstract class _$$QuestionAddSuccessStateImplCopyWith<$Res> {
  factory _$$QuestionAddSuccessStateImplCopyWith(
          _$QuestionAddSuccessStateImpl value,
          $Res Function(_$QuestionAddSuccessStateImpl) then) =
      __$$QuestionAddSuccessStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$QuestionAddSuccessStateImplCopyWithImpl<$Res>
    extends _$QuestionStateCopyWithImpl<$Res, _$QuestionAddSuccessStateImpl>
    implements _$$QuestionAddSuccessStateImplCopyWith<$Res> {
  __$$QuestionAddSuccessStateImplCopyWithImpl(
      _$QuestionAddSuccessStateImpl _value,
      $Res Function(_$QuestionAddSuccessStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$QuestionAddSuccessStateImpl implements QuestionAddSuccessState {
  const _$QuestionAddSuccessStateImpl();

  @override
  String toString() {
    return 'QuestionState.addSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionAddSuccessStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Question> entity) success,
    required TResult Function(Failure failure) error,
    required TResult Function() addLoading,
    required TResult Function() addSuccess,
    required TResult Function(Failure failure) addError,
    required TResult Function() deleteLoading,
    required TResult Function() deleteSuccess,
    required TResult Function(Failure failure) deleteError,
  }) {
    return addSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Question> entity)? success,
    TResult? Function(Failure failure)? error,
    TResult? Function()? addLoading,
    TResult? Function()? addSuccess,
    TResult? Function(Failure failure)? addError,
    TResult? Function()? deleteLoading,
    TResult? Function()? deleteSuccess,
    TResult? Function(Failure failure)? deleteError,
  }) {
    return addSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Question> entity)? success,
    TResult Function(Failure failure)? error,
    TResult Function()? addLoading,
    TResult Function()? addSuccess,
    TResult Function(Failure failure)? addError,
    TResult Function()? deleteLoading,
    TResult Function()? deleteSuccess,
    TResult Function(Failure failure)? deleteError,
    required TResult orElse(),
  }) {
    if (addSuccess != null) {
      return addSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuestionInitial value) initial,
    required TResult Function(QuestionLoadingState value) loading,
    required TResult Function(QuestionSuccessState value) success,
    required TResult Function(QuestionErrorState value) error,
    required TResult Function(QuestionAddLoadingState value) addLoading,
    required TResult Function(QuestionAddSuccessState value) addSuccess,
    required TResult Function(QuestionAddErrorState value) addError,
    required TResult Function(QuestionDeleteLoadingState value) deleteLoading,
    required TResult Function(QuestionDeleteSuccessState value) deleteSuccess,
    required TResult Function(QuestionDeleteErrorState value) deleteError,
  }) {
    return addSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuestionInitial value)? initial,
    TResult? Function(QuestionLoadingState value)? loading,
    TResult? Function(QuestionSuccessState value)? success,
    TResult? Function(QuestionErrorState value)? error,
    TResult? Function(QuestionAddLoadingState value)? addLoading,
    TResult? Function(QuestionAddSuccessState value)? addSuccess,
    TResult? Function(QuestionAddErrorState value)? addError,
    TResult? Function(QuestionDeleteLoadingState value)? deleteLoading,
    TResult? Function(QuestionDeleteSuccessState value)? deleteSuccess,
    TResult? Function(QuestionDeleteErrorState value)? deleteError,
  }) {
    return addSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuestionInitial value)? initial,
    TResult Function(QuestionLoadingState value)? loading,
    TResult Function(QuestionSuccessState value)? success,
    TResult Function(QuestionErrorState value)? error,
    TResult Function(QuestionAddLoadingState value)? addLoading,
    TResult Function(QuestionAddSuccessState value)? addSuccess,
    TResult Function(QuestionAddErrorState value)? addError,
    TResult Function(QuestionDeleteLoadingState value)? deleteLoading,
    TResult Function(QuestionDeleteSuccessState value)? deleteSuccess,
    TResult Function(QuestionDeleteErrorState value)? deleteError,
    required TResult orElse(),
  }) {
    if (addSuccess != null) {
      return addSuccess(this);
    }
    return orElse();
  }
}

abstract class QuestionAddSuccessState implements QuestionState {
  const factory QuestionAddSuccessState() = _$QuestionAddSuccessStateImpl;
}

/// @nodoc
abstract class _$$QuestionAddErrorStateImplCopyWith<$Res> {
  factory _$$QuestionAddErrorStateImplCopyWith(
          _$QuestionAddErrorStateImpl value,
          $Res Function(_$QuestionAddErrorStateImpl) then) =
      __$$QuestionAddErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class __$$QuestionAddErrorStateImplCopyWithImpl<$Res>
    extends _$QuestionStateCopyWithImpl<$Res, _$QuestionAddErrorStateImpl>
    implements _$$QuestionAddErrorStateImplCopyWith<$Res> {
  __$$QuestionAddErrorStateImplCopyWithImpl(_$QuestionAddErrorStateImpl _value,
      $Res Function(_$QuestionAddErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$QuestionAddErrorStateImpl(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$QuestionAddErrorStateImpl implements QuestionAddErrorState {
  const _$QuestionAddErrorStateImpl(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'QuestionState.addError(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionAddErrorStateImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionAddErrorStateImplCopyWith<_$QuestionAddErrorStateImpl>
      get copyWith => __$$QuestionAddErrorStateImplCopyWithImpl<
          _$QuestionAddErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Question> entity) success,
    required TResult Function(Failure failure) error,
    required TResult Function() addLoading,
    required TResult Function() addSuccess,
    required TResult Function(Failure failure) addError,
    required TResult Function() deleteLoading,
    required TResult Function() deleteSuccess,
    required TResult Function(Failure failure) deleteError,
  }) {
    return addError(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Question> entity)? success,
    TResult? Function(Failure failure)? error,
    TResult? Function()? addLoading,
    TResult? Function()? addSuccess,
    TResult? Function(Failure failure)? addError,
    TResult? Function()? deleteLoading,
    TResult? Function()? deleteSuccess,
    TResult? Function(Failure failure)? deleteError,
  }) {
    return addError?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Question> entity)? success,
    TResult Function(Failure failure)? error,
    TResult Function()? addLoading,
    TResult Function()? addSuccess,
    TResult Function(Failure failure)? addError,
    TResult Function()? deleteLoading,
    TResult Function()? deleteSuccess,
    TResult Function(Failure failure)? deleteError,
    required TResult orElse(),
  }) {
    if (addError != null) {
      return addError(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuestionInitial value) initial,
    required TResult Function(QuestionLoadingState value) loading,
    required TResult Function(QuestionSuccessState value) success,
    required TResult Function(QuestionErrorState value) error,
    required TResult Function(QuestionAddLoadingState value) addLoading,
    required TResult Function(QuestionAddSuccessState value) addSuccess,
    required TResult Function(QuestionAddErrorState value) addError,
    required TResult Function(QuestionDeleteLoadingState value) deleteLoading,
    required TResult Function(QuestionDeleteSuccessState value) deleteSuccess,
    required TResult Function(QuestionDeleteErrorState value) deleteError,
  }) {
    return addError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuestionInitial value)? initial,
    TResult? Function(QuestionLoadingState value)? loading,
    TResult? Function(QuestionSuccessState value)? success,
    TResult? Function(QuestionErrorState value)? error,
    TResult? Function(QuestionAddLoadingState value)? addLoading,
    TResult? Function(QuestionAddSuccessState value)? addSuccess,
    TResult? Function(QuestionAddErrorState value)? addError,
    TResult? Function(QuestionDeleteLoadingState value)? deleteLoading,
    TResult? Function(QuestionDeleteSuccessState value)? deleteSuccess,
    TResult? Function(QuestionDeleteErrorState value)? deleteError,
  }) {
    return addError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuestionInitial value)? initial,
    TResult Function(QuestionLoadingState value)? loading,
    TResult Function(QuestionSuccessState value)? success,
    TResult Function(QuestionErrorState value)? error,
    TResult Function(QuestionAddLoadingState value)? addLoading,
    TResult Function(QuestionAddSuccessState value)? addSuccess,
    TResult Function(QuestionAddErrorState value)? addError,
    TResult Function(QuestionDeleteLoadingState value)? deleteLoading,
    TResult Function(QuestionDeleteSuccessState value)? deleteSuccess,
    TResult Function(QuestionDeleteErrorState value)? deleteError,
    required TResult orElse(),
  }) {
    if (addError != null) {
      return addError(this);
    }
    return orElse();
  }
}

abstract class QuestionAddErrorState implements QuestionState {
  const factory QuestionAddErrorState(final Failure failure) =
      _$QuestionAddErrorStateImpl;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$QuestionAddErrorStateImplCopyWith<_$QuestionAddErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QuestionDeleteLoadingStateImplCopyWith<$Res> {
  factory _$$QuestionDeleteLoadingStateImplCopyWith(
          _$QuestionDeleteLoadingStateImpl value,
          $Res Function(_$QuestionDeleteLoadingStateImpl) then) =
      __$$QuestionDeleteLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$QuestionDeleteLoadingStateImplCopyWithImpl<$Res>
    extends _$QuestionStateCopyWithImpl<$Res, _$QuestionDeleteLoadingStateImpl>
    implements _$$QuestionDeleteLoadingStateImplCopyWith<$Res> {
  __$$QuestionDeleteLoadingStateImplCopyWithImpl(
      _$QuestionDeleteLoadingStateImpl _value,
      $Res Function(_$QuestionDeleteLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$QuestionDeleteLoadingStateImpl implements QuestionDeleteLoadingState {
  const _$QuestionDeleteLoadingStateImpl();

  @override
  String toString() {
    return 'QuestionState.deleteLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionDeleteLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Question> entity) success,
    required TResult Function(Failure failure) error,
    required TResult Function() addLoading,
    required TResult Function() addSuccess,
    required TResult Function(Failure failure) addError,
    required TResult Function() deleteLoading,
    required TResult Function() deleteSuccess,
    required TResult Function(Failure failure) deleteError,
  }) {
    return deleteLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Question> entity)? success,
    TResult? Function(Failure failure)? error,
    TResult? Function()? addLoading,
    TResult? Function()? addSuccess,
    TResult? Function(Failure failure)? addError,
    TResult? Function()? deleteLoading,
    TResult? Function()? deleteSuccess,
    TResult? Function(Failure failure)? deleteError,
  }) {
    return deleteLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Question> entity)? success,
    TResult Function(Failure failure)? error,
    TResult Function()? addLoading,
    TResult Function()? addSuccess,
    TResult Function(Failure failure)? addError,
    TResult Function()? deleteLoading,
    TResult Function()? deleteSuccess,
    TResult Function(Failure failure)? deleteError,
    required TResult orElse(),
  }) {
    if (deleteLoading != null) {
      return deleteLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuestionInitial value) initial,
    required TResult Function(QuestionLoadingState value) loading,
    required TResult Function(QuestionSuccessState value) success,
    required TResult Function(QuestionErrorState value) error,
    required TResult Function(QuestionAddLoadingState value) addLoading,
    required TResult Function(QuestionAddSuccessState value) addSuccess,
    required TResult Function(QuestionAddErrorState value) addError,
    required TResult Function(QuestionDeleteLoadingState value) deleteLoading,
    required TResult Function(QuestionDeleteSuccessState value) deleteSuccess,
    required TResult Function(QuestionDeleteErrorState value) deleteError,
  }) {
    return deleteLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuestionInitial value)? initial,
    TResult? Function(QuestionLoadingState value)? loading,
    TResult? Function(QuestionSuccessState value)? success,
    TResult? Function(QuestionErrorState value)? error,
    TResult? Function(QuestionAddLoadingState value)? addLoading,
    TResult? Function(QuestionAddSuccessState value)? addSuccess,
    TResult? Function(QuestionAddErrorState value)? addError,
    TResult? Function(QuestionDeleteLoadingState value)? deleteLoading,
    TResult? Function(QuestionDeleteSuccessState value)? deleteSuccess,
    TResult? Function(QuestionDeleteErrorState value)? deleteError,
  }) {
    return deleteLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuestionInitial value)? initial,
    TResult Function(QuestionLoadingState value)? loading,
    TResult Function(QuestionSuccessState value)? success,
    TResult Function(QuestionErrorState value)? error,
    TResult Function(QuestionAddLoadingState value)? addLoading,
    TResult Function(QuestionAddSuccessState value)? addSuccess,
    TResult Function(QuestionAddErrorState value)? addError,
    TResult Function(QuestionDeleteLoadingState value)? deleteLoading,
    TResult Function(QuestionDeleteSuccessState value)? deleteSuccess,
    TResult Function(QuestionDeleteErrorState value)? deleteError,
    required TResult orElse(),
  }) {
    if (deleteLoading != null) {
      return deleteLoading(this);
    }
    return orElse();
  }
}

abstract class QuestionDeleteLoadingState implements QuestionState {
  const factory QuestionDeleteLoadingState() = _$QuestionDeleteLoadingStateImpl;
}

/// @nodoc
abstract class _$$QuestionDeleteSuccessStateImplCopyWith<$Res> {
  factory _$$QuestionDeleteSuccessStateImplCopyWith(
          _$QuestionDeleteSuccessStateImpl value,
          $Res Function(_$QuestionDeleteSuccessStateImpl) then) =
      __$$QuestionDeleteSuccessStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$QuestionDeleteSuccessStateImplCopyWithImpl<$Res>
    extends _$QuestionStateCopyWithImpl<$Res, _$QuestionDeleteSuccessStateImpl>
    implements _$$QuestionDeleteSuccessStateImplCopyWith<$Res> {
  __$$QuestionDeleteSuccessStateImplCopyWithImpl(
      _$QuestionDeleteSuccessStateImpl _value,
      $Res Function(_$QuestionDeleteSuccessStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$QuestionDeleteSuccessStateImpl implements QuestionDeleteSuccessState {
  const _$QuestionDeleteSuccessStateImpl();

  @override
  String toString() {
    return 'QuestionState.deleteSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionDeleteSuccessStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Question> entity) success,
    required TResult Function(Failure failure) error,
    required TResult Function() addLoading,
    required TResult Function() addSuccess,
    required TResult Function(Failure failure) addError,
    required TResult Function() deleteLoading,
    required TResult Function() deleteSuccess,
    required TResult Function(Failure failure) deleteError,
  }) {
    return deleteSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Question> entity)? success,
    TResult? Function(Failure failure)? error,
    TResult? Function()? addLoading,
    TResult? Function()? addSuccess,
    TResult? Function(Failure failure)? addError,
    TResult? Function()? deleteLoading,
    TResult? Function()? deleteSuccess,
    TResult? Function(Failure failure)? deleteError,
  }) {
    return deleteSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Question> entity)? success,
    TResult Function(Failure failure)? error,
    TResult Function()? addLoading,
    TResult Function()? addSuccess,
    TResult Function(Failure failure)? addError,
    TResult Function()? deleteLoading,
    TResult Function()? deleteSuccess,
    TResult Function(Failure failure)? deleteError,
    required TResult orElse(),
  }) {
    if (deleteSuccess != null) {
      return deleteSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuestionInitial value) initial,
    required TResult Function(QuestionLoadingState value) loading,
    required TResult Function(QuestionSuccessState value) success,
    required TResult Function(QuestionErrorState value) error,
    required TResult Function(QuestionAddLoadingState value) addLoading,
    required TResult Function(QuestionAddSuccessState value) addSuccess,
    required TResult Function(QuestionAddErrorState value) addError,
    required TResult Function(QuestionDeleteLoadingState value) deleteLoading,
    required TResult Function(QuestionDeleteSuccessState value) deleteSuccess,
    required TResult Function(QuestionDeleteErrorState value) deleteError,
  }) {
    return deleteSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuestionInitial value)? initial,
    TResult? Function(QuestionLoadingState value)? loading,
    TResult? Function(QuestionSuccessState value)? success,
    TResult? Function(QuestionErrorState value)? error,
    TResult? Function(QuestionAddLoadingState value)? addLoading,
    TResult? Function(QuestionAddSuccessState value)? addSuccess,
    TResult? Function(QuestionAddErrorState value)? addError,
    TResult? Function(QuestionDeleteLoadingState value)? deleteLoading,
    TResult? Function(QuestionDeleteSuccessState value)? deleteSuccess,
    TResult? Function(QuestionDeleteErrorState value)? deleteError,
  }) {
    return deleteSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuestionInitial value)? initial,
    TResult Function(QuestionLoadingState value)? loading,
    TResult Function(QuestionSuccessState value)? success,
    TResult Function(QuestionErrorState value)? error,
    TResult Function(QuestionAddLoadingState value)? addLoading,
    TResult Function(QuestionAddSuccessState value)? addSuccess,
    TResult Function(QuestionAddErrorState value)? addError,
    TResult Function(QuestionDeleteLoadingState value)? deleteLoading,
    TResult Function(QuestionDeleteSuccessState value)? deleteSuccess,
    TResult Function(QuestionDeleteErrorState value)? deleteError,
    required TResult orElse(),
  }) {
    if (deleteSuccess != null) {
      return deleteSuccess(this);
    }
    return orElse();
  }
}

abstract class QuestionDeleteSuccessState implements QuestionState {
  const factory QuestionDeleteSuccessState() = _$QuestionDeleteSuccessStateImpl;
}

/// @nodoc
abstract class _$$QuestionDeleteErrorStateImplCopyWith<$Res> {
  factory _$$QuestionDeleteErrorStateImplCopyWith(
          _$QuestionDeleteErrorStateImpl value,
          $Res Function(_$QuestionDeleteErrorStateImpl) then) =
      __$$QuestionDeleteErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Failure failure});
}

/// @nodoc
class __$$QuestionDeleteErrorStateImplCopyWithImpl<$Res>
    extends _$QuestionStateCopyWithImpl<$Res, _$QuestionDeleteErrorStateImpl>
    implements _$$QuestionDeleteErrorStateImplCopyWith<$Res> {
  __$$QuestionDeleteErrorStateImplCopyWithImpl(
      _$QuestionDeleteErrorStateImpl _value,
      $Res Function(_$QuestionDeleteErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
  }) {
    return _then(_$QuestionDeleteErrorStateImpl(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$QuestionDeleteErrorStateImpl implements QuestionDeleteErrorState {
  const _$QuestionDeleteErrorStateImpl(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'QuestionState.deleteError(failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionDeleteErrorStateImpl &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionDeleteErrorStateImplCopyWith<_$QuestionDeleteErrorStateImpl>
      get copyWith => __$$QuestionDeleteErrorStateImplCopyWithImpl<
          _$QuestionDeleteErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Question> entity) success,
    required TResult Function(Failure failure) error,
    required TResult Function() addLoading,
    required TResult Function() addSuccess,
    required TResult Function(Failure failure) addError,
    required TResult Function() deleteLoading,
    required TResult Function() deleteSuccess,
    required TResult Function(Failure failure) deleteError,
  }) {
    return deleteError(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Question> entity)? success,
    TResult? Function(Failure failure)? error,
    TResult? Function()? addLoading,
    TResult? Function()? addSuccess,
    TResult? Function(Failure failure)? addError,
    TResult? Function()? deleteLoading,
    TResult? Function()? deleteSuccess,
    TResult? Function(Failure failure)? deleteError,
  }) {
    return deleteError?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Question> entity)? success,
    TResult Function(Failure failure)? error,
    TResult Function()? addLoading,
    TResult Function()? addSuccess,
    TResult Function(Failure failure)? addError,
    TResult Function()? deleteLoading,
    TResult Function()? deleteSuccess,
    TResult Function(Failure failure)? deleteError,
    required TResult orElse(),
  }) {
    if (deleteError != null) {
      return deleteError(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QuestionInitial value) initial,
    required TResult Function(QuestionLoadingState value) loading,
    required TResult Function(QuestionSuccessState value) success,
    required TResult Function(QuestionErrorState value) error,
    required TResult Function(QuestionAddLoadingState value) addLoading,
    required TResult Function(QuestionAddSuccessState value) addSuccess,
    required TResult Function(QuestionAddErrorState value) addError,
    required TResult Function(QuestionDeleteLoadingState value) deleteLoading,
    required TResult Function(QuestionDeleteSuccessState value) deleteSuccess,
    required TResult Function(QuestionDeleteErrorState value) deleteError,
  }) {
    return deleteError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QuestionInitial value)? initial,
    TResult? Function(QuestionLoadingState value)? loading,
    TResult? Function(QuestionSuccessState value)? success,
    TResult? Function(QuestionErrorState value)? error,
    TResult? Function(QuestionAddLoadingState value)? addLoading,
    TResult? Function(QuestionAddSuccessState value)? addSuccess,
    TResult? Function(QuestionAddErrorState value)? addError,
    TResult? Function(QuestionDeleteLoadingState value)? deleteLoading,
    TResult? Function(QuestionDeleteSuccessState value)? deleteSuccess,
    TResult? Function(QuestionDeleteErrorState value)? deleteError,
  }) {
    return deleteError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QuestionInitial value)? initial,
    TResult Function(QuestionLoadingState value)? loading,
    TResult Function(QuestionSuccessState value)? success,
    TResult Function(QuestionErrorState value)? error,
    TResult Function(QuestionAddLoadingState value)? addLoading,
    TResult Function(QuestionAddSuccessState value)? addSuccess,
    TResult Function(QuestionAddErrorState value)? addError,
    TResult Function(QuestionDeleteLoadingState value)? deleteLoading,
    TResult Function(QuestionDeleteSuccessState value)? deleteSuccess,
    TResult Function(QuestionDeleteErrorState value)? deleteError,
    required TResult orElse(),
  }) {
    if (deleteError != null) {
      return deleteError(this);
    }
    return orElse();
  }
}

abstract class QuestionDeleteErrorState implements QuestionState {
  const factory QuestionDeleteErrorState(final Failure failure) =
      _$QuestionDeleteErrorStateImpl;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$QuestionDeleteErrorStateImplCopyWith<_$QuestionDeleteErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
