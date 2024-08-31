import 'package:flutter/material.dart';
import 'package:frontend/widgets/lobby_page.dart';

class FinishedPage extends StatelessWidget {
  const FinishedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("ここにいい感じのラジオ体操カード"),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LobbyPage()),
                  (route) => false,
                );
              },
              // for debug
              child: const Text("ホームへ戻る"),
            ),
          )
        ],
      ),
    );
  }
}
