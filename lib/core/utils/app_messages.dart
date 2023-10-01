import 'package:flutter/material.dart';
import 'package:reminders_app/core/core.dart';

abstract class AppMessages {
  static show({
    required GlobalKey<ScaffoldMessengerState> messengerKey,
    required AppMessage message,
  }) {
    messengerKey.currentState!.hideCurrentSnackBar();

    Color backgroundColor = Colors.green;
    if (message.type == MessageType.failure) {
      backgroundColor = Colors.red;
    }

    final snackBar = SnackBar(
      content: Text(
        message.msg,
        // style: const TextStyle(color: Colors.black),
      ),
      backgroundColor: backgroundColor,
    );
    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
