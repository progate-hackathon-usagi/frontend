import 'package:flutter/material.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    const headingTextStyle = TextStyle(fontSize: 36, color: Colors.black);

    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              // TODO: finished page
            },
            // for debug
            child: const Text("ラジオ体操を終了する")),
      ),
    );
  }
}
