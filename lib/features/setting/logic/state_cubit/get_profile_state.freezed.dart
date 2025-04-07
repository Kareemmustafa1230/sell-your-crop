// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(GetProfileResponse getProfileResponse)
        loadSuccess,
    required TResult Function(String message) updateSuccess,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(GetProfileResponse getProfileResponse)? loadSuccess,
    TResult? Function(String message)? updateSuccess,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GetProfileResponse getProfileResponse)? loadSuccess,
    TResult Function(String message)? updateSuccess,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(LoadSuccess<T> value) loadSuccess,
    required TResult Function(UpdateSuccess<T> value) updateSuccess,
    required TResult Function(Error<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(LoadSuccess<T> value)? loadSuccess,
    TResult? Function(UpdateSuccess<T> value)? updateSuccess,
    TResult? Function(Error<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(LoadSuccess<T> value)? loadSuccess,
    TResult Function(UpdateSuccess<T> value)? updateSuccess,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<T, $Res> {
  factory $ProfileStateCopyWith(
          ProfileState<T> value, $Res Function(ProfileState<T>) then) =
      _$ProfileStateCopyWithImpl<T, $Res, ProfileState<T>>;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<T, $Res, $Val extends ProfileState<T>>
    implements $ProfileStateCopyWith<T, $Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$ProfileStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ProfileState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(GetProfileResponse getProfileResponse)
        loadSuccess,
    required TResult Function(String message) updateSuccess,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(GetProfileResponse getProfileResponse)? loadSuccess,
    TResult? Function(String message)? updateSuccess,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GetProfileResponse getProfileResponse)? loadSuccess,
    TResult Function(String message)? updateSuccess,
    TResult Function(String error)? error,
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
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(LoadSuccess<T> value) loadSuccess,
    required TResult Function(UpdateSuccess<T> value) updateSuccess,
    required TResult Function(Error<T> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(LoadSuccess<T> value)? loadSuccess,
    TResult? Function(UpdateSuccess<T> value)? updateSuccess,
    TResult? Function(Error<T> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(LoadSuccess<T> value)? loadSuccess,
    TResult Function(UpdateSuccess<T> value)? updateSuccess,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements ProfileState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<T, $Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl<T> value, $Res Function(_$LoadingImpl<T>) then) =
      __$$LoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<T, $Res>
    extends _$ProfileStateCopyWithImpl<T, $Res, _$LoadingImpl<T>>
    implements _$$LoadingImplCopyWith<T, $Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl<T> _value, $Res Function(_$LoadingImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl<T> implements Loading<T> {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ProfileState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(GetProfileResponse getProfileResponse)
        loadSuccess,
    required TResult Function(String message) updateSuccess,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(GetProfileResponse getProfileResponse)? loadSuccess,
    TResult? Function(String message)? updateSuccess,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GetProfileResponse getProfileResponse)? loadSuccess,
    TResult Function(String message)? updateSuccess,
    TResult Function(String error)? error,
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
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(LoadSuccess<T> value) loadSuccess,
    required TResult Function(UpdateSuccess<T> value) updateSuccess,
    required TResult Function(Error<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(LoadSuccess<T> value)? loadSuccess,
    TResult? Function(UpdateSuccess<T> value)? updateSuccess,
    TResult? Function(Error<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(LoadSuccess<T> value)? loadSuccess,
    TResult Function(UpdateSuccess<T> value)? updateSuccess,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<T> implements ProfileState<T> {
  const factory Loading() = _$LoadingImpl<T>;
}

/// @nodoc
abstract class _$$LoadSuccessImplCopyWith<T, $Res> {
  factory _$$LoadSuccessImplCopyWith(_$LoadSuccessImpl<T> value,
          $Res Function(_$LoadSuccessImpl<T>) then) =
      __$$LoadSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({GetProfileResponse getProfileResponse});
}

/// @nodoc
class __$$LoadSuccessImplCopyWithImpl<T, $Res>
    extends _$ProfileStateCopyWithImpl<T, $Res, _$LoadSuccessImpl<T>>
    implements _$$LoadSuccessImplCopyWith<T, $Res> {
  __$$LoadSuccessImplCopyWithImpl(
      _$LoadSuccessImpl<T> _value, $Res Function(_$LoadSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getProfileResponse = null,
  }) {
    return _then(_$LoadSuccessImpl<T>(
      getProfileResponse: null == getProfileResponse
          ? _value.getProfileResponse
          : getProfileResponse // ignore: cast_nullable_to_non_nullable
              as GetProfileResponse,
    ));
  }
}

/// @nodoc

class _$LoadSuccessImpl<T> implements LoadSuccess<T> {
  const _$LoadSuccessImpl({required this.getProfileResponse});

  @override
  final GetProfileResponse getProfileResponse;

  @override
  String toString() {
    return 'ProfileState<$T>.loadSuccess(getProfileResponse: $getProfileResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSuccessImpl<T> &&
            (identical(other.getProfileResponse, getProfileResponse) ||
                other.getProfileResponse == getProfileResponse));
  }

  @override
  int get hashCode => Object.hash(runtimeType, getProfileResponse);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadSuccessImplCopyWith<T, _$LoadSuccessImpl<T>> get copyWith =>
      __$$LoadSuccessImplCopyWithImpl<T, _$LoadSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(GetProfileResponse getProfileResponse)
        loadSuccess,
    required TResult Function(String message) updateSuccess,
    required TResult Function(String error) error,
  }) {
    return loadSuccess(getProfileResponse);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(GetProfileResponse getProfileResponse)? loadSuccess,
    TResult? Function(String message)? updateSuccess,
    TResult? Function(String error)? error,
  }) {
    return loadSuccess?.call(getProfileResponse);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GetProfileResponse getProfileResponse)? loadSuccess,
    TResult Function(String message)? updateSuccess,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(getProfileResponse);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(LoadSuccess<T> value) loadSuccess,
    required TResult Function(UpdateSuccess<T> value) updateSuccess,
    required TResult Function(Error<T> value) error,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(LoadSuccess<T> value)? loadSuccess,
    TResult? Function(UpdateSuccess<T> value)? updateSuccess,
    TResult? Function(Error<T> value)? error,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(LoadSuccess<T> value)? loadSuccess,
    TResult Function(UpdateSuccess<T> value)? updateSuccess,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class LoadSuccess<T> implements ProfileState<T> {
  const factory LoadSuccess(
          {required final GetProfileResponse getProfileResponse}) =
      _$LoadSuccessImpl<T>;

  GetProfileResponse get getProfileResponse;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadSuccessImplCopyWith<T, _$LoadSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateSuccessImplCopyWith<T, $Res> {
  factory _$$UpdateSuccessImplCopyWith(_$UpdateSuccessImpl<T> value,
          $Res Function(_$UpdateSuccessImpl<T>) then) =
      __$$UpdateSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UpdateSuccessImplCopyWithImpl<T, $Res>
    extends _$ProfileStateCopyWithImpl<T, $Res, _$UpdateSuccessImpl<T>>
    implements _$$UpdateSuccessImplCopyWith<T, $Res> {
  __$$UpdateSuccessImplCopyWithImpl(_$UpdateSuccessImpl<T> _value,
      $Res Function(_$UpdateSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UpdateSuccessImpl<T>(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateSuccessImpl<T> implements UpdateSuccess<T> {
  const _$UpdateSuccessImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'ProfileState<$T>.updateSuccess(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSuccessImpl<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSuccessImplCopyWith<T, _$UpdateSuccessImpl<T>> get copyWith =>
      __$$UpdateSuccessImplCopyWithImpl<T, _$UpdateSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(GetProfileResponse getProfileResponse)
        loadSuccess,
    required TResult Function(String message) updateSuccess,
    required TResult Function(String error) error,
  }) {
    return updateSuccess(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(GetProfileResponse getProfileResponse)? loadSuccess,
    TResult? Function(String message)? updateSuccess,
    TResult? Function(String error)? error,
  }) {
    return updateSuccess?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GetProfileResponse getProfileResponse)? loadSuccess,
    TResult Function(String message)? updateSuccess,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (updateSuccess != null) {
      return updateSuccess(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(LoadSuccess<T> value) loadSuccess,
    required TResult Function(UpdateSuccess<T> value) updateSuccess,
    required TResult Function(Error<T> value) error,
  }) {
    return updateSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(LoadSuccess<T> value)? loadSuccess,
    TResult? Function(UpdateSuccess<T> value)? updateSuccess,
    TResult? Function(Error<T> value)? error,
  }) {
    return updateSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(LoadSuccess<T> value)? loadSuccess,
    TResult Function(UpdateSuccess<T> value)? updateSuccess,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (updateSuccess != null) {
      return updateSuccess(this);
    }
    return orElse();
  }
}

abstract class UpdateSuccess<T> implements ProfileState<T> {
  const factory UpdateSuccess({required final String message}) =
      _$UpdateSuccessImpl<T>;

  String get message;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateSuccessImplCopyWith<T, _$UpdateSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<T, $Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl<T> value, $Res Function(_$ErrorImpl<T>) then) =
      __$$ErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<T, $Res>
    extends _$ProfileStateCopyWithImpl<T, $Res, _$ErrorImpl<T>>
    implements _$$ErrorImplCopyWith<T, $Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl<T> _value, $Res Function(_$ErrorImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl<T> implements Error<T> {
  const _$ErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'ProfileState<$T>.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      __$$ErrorImplCopyWithImpl<T, _$ErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(GetProfileResponse getProfileResponse)
        loadSuccess,
    required TResult Function(String message) updateSuccess,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(GetProfileResponse getProfileResponse)? loadSuccess,
    TResult? Function(String message)? updateSuccess,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(GetProfileResponse getProfileResponse)? loadSuccess,
    TResult Function(String message)? updateSuccess,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(LoadSuccess<T> value) loadSuccess,
    required TResult Function(UpdateSuccess<T> value) updateSuccess,
    required TResult Function(Error<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(LoadSuccess<T> value)? loadSuccess,
    TResult? Function(UpdateSuccess<T> value)? updateSuccess,
    TResult? Function(Error<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(LoadSuccess<T> value)? loadSuccess,
    TResult Function(UpdateSuccess<T> value)? updateSuccess,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error<T> implements ProfileState<T> {
  const factory Error({required final String error}) = _$ErrorImpl<T>;

  String get error;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
