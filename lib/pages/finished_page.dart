import 'package:flutter/material.dart';

class FinishedPage extends StatelessWidget {
  const FinishedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, "/lobby", (_) => false);
            },
            // for debug
            child: const Text("ホームへ戻る")),
      ),
    );
  }
}
