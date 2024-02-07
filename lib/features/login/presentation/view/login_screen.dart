import 'package:docdoc/core/extensions/navigation.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('back')),
      ),
    );
  }
}
