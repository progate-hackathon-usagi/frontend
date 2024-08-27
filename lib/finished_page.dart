import 'package:flutter/material.dart';

class FinishedPage extends StatelessWidget {
  const FinishedPage({super.key});

  @override
  Widget build(BuildContext context) {
    const headingTextStyle = TextStyle(fontSize: 36, color: Colors.black);

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
