import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_timer/timer/timer_model.dart';
import 'package:riverpod_timer/timer/timer_notifier.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<TimerState>(
        timerNotifierProvider.select((value) => value.timerState), (_, state) {
      if (state == TimerState.finished) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Timer Finished'),
          action: SnackBarAction(
            label: 'Restart',
            onPressed: () {
              ref.read(timerNotifierProvider.notifier).reset();
            },
          ),
        ));
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod Timer')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            TimerTextWidget(),
            SizedBox(height: 20),
            ButtonsContainer(),
          ],
        ),
      ),
    );
  }
}

class TimerTextWidget extends ConsumerWidget {
  const TimerTextWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeLeft =
        ref.watch(timerNotifierProvider.select((value) => value.timeLeft));
    return Text(
      timeLeft,
      style: Theme.of(context).textTheme.displayMedium,
    );
  }
}

class ButtonsContainer extends ConsumerWidget {
  const ButtonsContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state =
        ref.watch(timerNotifierProvider.select((value) => value.timerState));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (state == TimerState.initial) ...[
          const StartButton(),
        ],
        if (state == TimerState.started) ...[
          const PauseButton(),
          const SizedBox(width: 20),
          const ResetButton(),
        ],
        if (state == TimerState.paused) ...[
          const StartButton(),
          const SizedBox(width: 20),
          const ResetButton(),
        ],
        if (state == TimerState.finished) ...[
          const ResetButton(),
        ],
      ],
    );
  }
}

class StartButton extends ConsumerWidget {
  const StartButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        ref.read(timerNotifierProvider.notifier).start();
      },
      child: const Icon(Icons.play_arrow),
    );
  }
}

class PauseButton extends ConsumerWidget {
  const PauseButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        ref.read(timerNotifierProvider.notifier).pause();
      },
      child: const Icon(Icons.pause),
    );
  }
}

class ResetButton extends ConsumerWidget {
  const ResetButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        ref.read(timerNotifierProvider.notifier).reset();
      },
      child: const Icon(Icons.replay),
    );
  }
}
