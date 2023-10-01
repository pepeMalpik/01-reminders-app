import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:reminders_app/core/core.dart';
import 'package:reminders_app/features/dashboard/dashboard.dart';

class RemindersApp extends ConsumerStatefulWidget {
  const RemindersApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RemindersAppState();
}

class _RemindersAppState extends ConsumerState<RemindersApp> {
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    ref.listen(
      appMessagesProvider,
      (previous, next) {
        if (next.type == MessageType.none || next.msg == '') {
          return;
        }
        AppMessages.show(messengerKey: _messengerKey, message: next);
      },
    );

    final route = ref.watch(routesProvider);

    return MaterialApp.router(
      scaffoldMessengerKey: _messengerKey,
      debugShowCheckedModeBanner: false,
      title: 'Reminders App',
      themeMode: ThemeMode.system,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: route,
    );
  }
}
