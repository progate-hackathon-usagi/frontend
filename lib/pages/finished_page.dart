import 'package:flutter/material.dart';
import 'package:frontend/pages/screens/tab_bar.dart';

class FinishedPage extends StatelessWidget {
  const FinishedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const TabBarWidget()),
                (route) => false,
              );
            },
            // for debug
            child: const Text("ホームへ戻る")),
      ),
    );
  }
}
