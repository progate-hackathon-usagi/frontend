import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend/widgets/daily_check_list.dart';
import 'package:frontend/widgets/lobby_page.dart';

class FinishedPage extends StatelessWidget {
  const FinishedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "スタンプ獲得！",
            style: TextStyle(
                color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          DailyCheckList(isExercisedList: List.generate(31, (index) => false)),
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
