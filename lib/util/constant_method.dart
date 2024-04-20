import 'dart:async';


Stream<int> startTimer() {
  const duration = Duration(seconds: 10);
  int elapsedSeconds = 0;
  StreamController<int> controller = StreamController<int>();

  Timer.periodic(const Duration(seconds: 1), (timer) {
    elapsedSeconds++;
    int remainingSeconds = duration.inSeconds - elapsedSeconds;
    if (remainingSeconds >= 0) {
      controller.add(remainingSeconds);
    } else {
      controller.close();
      timer.cancel();
    }
  });

  return controller.stream;
}