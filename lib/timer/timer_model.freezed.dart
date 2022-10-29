// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'timer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TimerModel {
  String get timeLeft => throw _privateConstructorUsedError;
  TimerState get timerState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimerModelCopyWith<TimerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerModelCopyWith<$Res> {
  factory $TimerModelCopyWith(
          TimerModel value, $Res Function(TimerModel) then) =
      _$TimerModelCopyWithImpl<$Res, TimerModel>;
  @useResult
  $Res call({String timeLeft, TimerState timerState});
}

/// @nodoc
class _$TimerModelCopyWithImpl<$Res, $Val extends TimerModel>
    implements $TimerModelCopyWith<$Res> {
  _$TimerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeLeft = null,
    Object? timerState = null,
  }) {
    return _then(_value.copyWith(
      timeLeft: null == timeLeft
          ? _value.timeLeft
          : timeLeft // ignore: cast_nullable_to_non_nullable
              as String,
      timerState: null == timerState
          ? _value.timerState
          : timerState // ignore: cast_nullable_to_non_nullable
              as TimerState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimerModelCopyWith<$Res>
    implements $TimerModelCopyWith<$Res> {
  factory _$$_TimerModelCopyWith(
          _$_TimerModel value, $Res Function(_$_TimerModel) then) =
      __$$_TimerModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String timeLeft, TimerState timerState});
}

/// @nodoc
class __$$_TimerModelCopyWithImpl<$Res>
    extends _$TimerModelCopyWithImpl<$Res, _$_TimerModel>
    implements _$$_TimerModelCopyWith<$Res> {
  __$$_TimerModelCopyWithImpl(
      _$_TimerModel _value, $Res Function(_$_TimerModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeLeft = null,
    Object? timerState = null,
  }) {
    return _then(_$_TimerModel(
      timeLeft: null == timeLeft
          ? _value.timeLeft
          : timeLeft // ignore: cast_nullable_to_non_nullable
              as String,
      timerState: null == timerState
          ? _value.timerState
          : timerState // ignore: cast_nullable_to_non_nullable
              as TimerState,
    ));
  }
}

/// @nodoc

class _$_TimerModel implements _TimerModel {
  const _$_TimerModel({required this.timeLeft, required this.timerState});

  @override
  final String timeLeft;
  @override
  final TimerState timerState;

  @override
  String toString() {
    return 'TimerModel(timeLeft: $timeLeft, timerState: $timerState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimerModel &&
            (identical(other.timeLeft, timeLeft) ||
                other.timeLeft == timeLeft) &&
            (identical(other.timerState, timerState) ||
                other.timerState == timerState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timeLeft, timerState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimerModelCopyWith<_$_TimerModel> get copyWith =>
      __$$_TimerModelCopyWithImpl<_$_TimerModel>(this, _$identity);
}

abstract class _TimerModel implements TimerModel {
  const factory _TimerModel(
      {required final String timeLeft,
      required final TimerState timerState}) = _$_TimerModel;

  @override
  String get timeLeft;
  @override
  TimerState get timerState;
  @override
  @JsonKey(ignore: true)
  _$$_TimerModelCopyWith<_$_TimerModel> get copyWith =>
      throw _privateConstructorUsedError;
}
