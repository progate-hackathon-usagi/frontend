import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frontend/pages/finished_page.dart';
import 'package:frontend/pages/lobby_page.dart';
import 'package:frontend/pages/profile_page.dart';
import 'package:frontend/pages/room_page.dart';
import 'package:frontend/pages/waiting_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: dotenv.get("SUPABASE_URL"),
    anonKey: dotenv.get("SUPABASE_ANON_KEY"),
  );

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
        "/profile": (BuildContext context) => const ProfilePage(),
        "/waiting": (BuildContext context) => WaitingPage(context),
        "/room": (BuildContext context) => const RoomPage(),
        "/finished": (BuildContext context) => const FinishedPage(),
      },
    );
  }
}
