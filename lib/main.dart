import 'package:flutter/material.dart';
import 'package:frontend/pages/finished_page.dart';
import 'package:frontend/pages/lobby_page.dart';
import 'package:frontend/pages/room_page.dart';
import 'package:frontend/pages/waiting_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LobbyPage(),
      routes: <String, WidgetBuilder>{
        "/lobby": (BuildContext context) => const LobbyPage(),
        "/waiting": (BuildContext context) => WaitingPage(context),
        "/room": (BuildContext context) => RoomPage(),
        "/finished": (BuildContext context) => const FinishedPage(),
      },
    );
  }
}
