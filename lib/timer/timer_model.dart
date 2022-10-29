import 'package:freezed_annotation/freezed_annotation.dart';
part 'timer_model.freezed.dart';

enum TimerState {
  initial,
  started,
  paused,
  finished,
}

@freezed
class TimerModel with _$TimerModel {
  const factory TimerModel({
    required String timeLeft,
    required TimerState timerState,
  }) = _TimerModel;
}
