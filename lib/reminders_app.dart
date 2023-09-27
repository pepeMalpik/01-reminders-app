import 'package:flutter/material.dart';
import 'package:reminders_app/core/core.dart';
import 'package:reminders_app/features/lists/lists.dart';

class RemindersApp extends StatelessWidget {
  const RemindersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reminders App',
      themeMode: ThemeMode.system,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const CreateListPage(),
    );
  }
}
