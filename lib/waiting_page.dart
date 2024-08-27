import 'package:flutter/material.dart';

class WaitingPage extends StatelessWidget {
  const WaitingPage(BuildContext context, {super.key, superKey});

  @override
  Widget build(BuildContext context) {
    const headingTextStyle = TextStyle(fontSize: 36, color: Colors.black);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/room');
            },
            // for debug
            child: const Text("ラジオ体操へ")),
      ),
    );
  }
}
