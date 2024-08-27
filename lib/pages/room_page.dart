import 'package:flutter/material.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/finished");
            },
            // for debug
            child: const Text("ラジオ体操を終了する")),
      ),
    );
  }
}
