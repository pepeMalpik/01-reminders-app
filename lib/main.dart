import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:reminders_app/core/core.dart';
import 'package:reminders_app/reminders_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper().init();
  runApp(
    const ProviderScope(
      child: RemindersApp(),
    ),
  );
}
