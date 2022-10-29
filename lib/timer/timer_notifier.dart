import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_timer/timer/ticker.dart';
import 'package:riverpod_timer/timer/timer_model.dart';

part 'timer_notifier.g.dart';

@Riverpod(keepAlive: true)
class TimerNotifier extends _$TimerNotifier {
  static const int _initialDuration = 10;
  static final _initialState = TimerModel(
    timeLeft: _durationString(_initialDuration),
    timerState: TimerState.initial,
  );

  final Ticker _ticker = Ticker();
  StreamSubscription<int>? _tickerSubscription;

  static String _durationString(int duration) {
    final minutes = ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final seconds = (duration % 60).floor().toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  TimerModel build() {
    return _initialState;
  }

  void start() {
    if (state.timerState == TimerState.paused) {
      _restartTimer();
    } else {
      _startTimer();
    }
  }

  void _restartTimer() {
    _tickerSubscription?.resume();
    state = TimerModel(
      timeLeft: state.timeLeft,
      timerState: TimerState.started,
    );
  }

  void _startTimer() {
    _tickerSubscription?.cancel();

    _tickerSubscription =
        _ticker.tick(ticks: _initialDuration).listen((duration) {
      state = TimerModel(
        timeLeft: _durationString(duration),
        timerState: TimerState.started,
      );
    });

    _tickerSubscription?.onDone(() {
      state = TimerModel(
        timeLeft: state.timeLeft,
        timerState: TimerState.finished,
      );
    });

    state = TimerModel(
      timeLeft: _durationString(_initialDuration),
      timerState: TimerState.started,
    );
  }

  void pause() {
    _tickerSubscription?.pause();
    state = TimerModel(timeLeft: state.timeLeft, timerState: TimerState.paused);
  }

  void reset() {
    _tickerSubscription?.cancel();
    state = _initialState;
  }

  /*void dispose() {
    _tickerSubscription?.cancel();
    //super.dispose();
  }*/
}
