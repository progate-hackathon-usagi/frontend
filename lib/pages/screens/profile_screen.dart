import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(
                    'https://via.placeholder.com/350x350?text=sample'),
              ),
              Text("おじ",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        '累計：785 日',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        '連続：420 日',
                        style: TextStyle(fontSize: 18),
                      ),
                      // 他のテキストウィジェットを追加
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
