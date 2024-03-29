// FLUTTER PACKAGES
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

mixin Messages<T extends StatefulWidget> on State<T> {
  void showError({required String message, FlushbarPosition? position}) {
    Flushbar(
      flushbarPosition: position ?? FlushbarPosition.TOP,
      backgroundColor: Colors.red,
      borderRadius: BorderRadius.circular(8),
      duration: const Duration(seconds: 3),
      icon: const Icon(
        Icons.warning,
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(8),
      message: message,
      mainButton: IconButton(
        alignment: Alignment.centerRight,
        iconSize: 20.0,
        onPressed: () {},
        icon: const Icon(
          Icons.cancel_outlined,
          color: Colors.white,
        ),
      ),
    ).show(context);
  }

  void showInfo(String message) {
    Flushbar(
      backgroundColor: Colors.orange,
      borderRadius: BorderRadius.circular(8),
      duration: const Duration(seconds: 3),
      icon: const Icon(
        Icons.warning,
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(8),
      message: message,
    ).show(context);
  }

  void showSuccess(String message) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Colors.green,
      borderRadius: BorderRadius.circular(8),
      duration: const Duration(seconds: 3),
      icon: const Icon(
        Icons.done,
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(8),
      message: message,
    ).show(context);
  }
}
