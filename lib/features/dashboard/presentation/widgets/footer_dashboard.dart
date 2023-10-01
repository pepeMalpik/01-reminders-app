import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reminders_app/core/core.dart';

class FooterDashboard extends ConsumerWidget {
  const FooterDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void newRemainder() {}

    void newList() {
      context.goNamed(RouteLocation.listCreate);
    }

    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: newRemainder,
            child: const Row(
              children: [
                Icon(Icons.add_circle),
                SizedBox(width: 10),
                Text('Nuevo'),
              ],
            ),
          ),
          TextButton(
            onPressed: newList,
            child: const Text('Agregar lista'),
          ),
        ],
      ),
    );
  }
}
