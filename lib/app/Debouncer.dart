import 'dart:async';

import 'package:flutter/foundation.dart';

class DebouncerClass {
  final int seconds;
  VoidCallback? action;
  Timer? timer;

  DebouncerClass({this.action, this.timer, required this.seconds});

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(Duration(seconds: seconds), action);
  }

  cancel() {
    timer?.cancel();
  }
}
