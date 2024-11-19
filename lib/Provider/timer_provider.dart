import 'dart:async';

import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  late Timer _timer;
  int _secondsRemaining = 10;
  int get secondsRemaining => _secondsRemaining;
  TimerProvider() {
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        _secondsRemaining--;
        notifyListeners();
      } else {
        _timer.cancel();
        print('Timer expired');
        _secondsRemaining == 10;
        notifyListeners();
      }
    });
  }

  void restartTimer() {
    _timer.cancel();
    _secondsRemaining = 10;
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
