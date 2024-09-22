import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

class Utils {
  static showDatePicker(
      {required BuildContext context,
      required Function(DateTime) onConfirm,
      DateTime? startDate}) {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: startDate ?? DateTime.now(),
      currentTime: DateTime.now(),
      locale: LocaleType.en,
      maxTime: DateTime.now().add(Duration(days: 3650)),
      onChanged: (date) {},
      onConfirm: (date) {
        onConfirm(date);
      },
    );
  }

  static showModalBottomSheetApp(
      {required Widget widget, required BuildContext context, Color? color}) {
    return showModalBottomSheet(
        isScrollControlled: false,
        context: context,
        backgroundColor: color ?? Colors.transparent,
        // barrierColor: ColorManager.barrierColor.withOpacity(.3),
        builder: (context) {
          return widget;
        });
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void showToast(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        action: SnackBarAction(
            label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  Future<void> showCustomDialog(
      BuildContext context, Widget dialogWidget) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: dialogWidget,
        );
      },
    );
  }

  Widget createHero({required String tag, required Widget child}) {
    return Hero(
      tag: tag,
      child: child,
    );
  }

  /// Fade animation utility
  Widget fadeTransition(
      BuildContext context, Widget child, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  /// Slide animation utility (for slide transitions)
  Widget slideTransition(
      BuildContext context, Widget child, Animation<double> animation) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    var offsetAnimation = animation.drive(tween);

    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }

  /// Scale animation utility
  Widget scaleTransition(
      BuildContext context, Widget child, Animation<double> animation) {
    return ScaleTransition(
      scale: animation,
      child: child,
    );
  }

  /// Utility for animating opacity
  AnimatedOpacity animateOpacity(bool isVisible, Widget child) {
    return AnimatedOpacity(
      opacity: isVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: child,
    );
  }
}
