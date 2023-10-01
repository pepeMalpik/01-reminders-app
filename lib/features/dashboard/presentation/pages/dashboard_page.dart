import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reminders_app/features/dashboard/dashboard.dart';

class DashboardPage extends ConsumerWidget {
  static DashboardPage builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const DashboardPage();

  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(child: Text('Listado de recordatorios')),
          ),
          FooterDashboard(),
        ],
      ),
    );
  }
}
