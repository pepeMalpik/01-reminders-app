import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppMessage {
  final MessageType type;
  final String msg;

  AppMessage({
    required this.type,
    required this.msg,
  });
}

enum MessageType {
  none,
  success,
  failure,
  info,
}

final appMessagesProvider = StateProvider(
  (ref) => AppMessage(
    type: MessageType.none,
    msg: '',
  ),
);
