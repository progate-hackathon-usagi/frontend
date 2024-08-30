import 'package:flutter/material.dart';

class LobbyPage extends StatelessWidget {
  const LobbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    const headingTextStyle = TextStyle(fontSize: 36, color: Colors.black);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            iconSize: 50,
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/waiting');
          },
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('ラジオ体操に', style: headingTextStyle),
              Text("参加する", style: headingTextStyle),
              SizedBox(height: 20),
              Text('212人が参加中...'),
            ],
          ),
        ),
      ),
    );
  }
}
