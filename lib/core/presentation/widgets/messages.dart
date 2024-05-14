import 'package:flutter/material.dart';

mixin Messages<T extends StatefulWidget> on State<T> {
  void showError({required String message, SnackBarBehavior? behavior}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: behavior ?? SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        content: Text(message),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Fechar',
          onPressed: () {},
          textColor: Colors.white,
        ),
      ),
    );
  }

  void showInfo(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.orange,
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
