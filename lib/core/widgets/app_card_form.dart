import 'package:flutter/material.dart';

class AppCardForm extends StatelessWidget {
  final Widget child;

  const AppCardForm({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Card(
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: child,
        ),
      ),
    );
  }
}
