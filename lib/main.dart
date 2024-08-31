import 'package:flutter/material.dart';
import 'package:frontend/widgets/lobby_page.dart';
import 'package:frontend/widgets/finished_page.dart';
import 'package:frontend/widgets/signin_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: const String.fromEnvironment('SUPABASE_URL'),
    anonKey: const String.fromEnvironment('SUPABASE_ANON_KEY'),
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: supabase.auth.currentUser == null
          ? const SigninPage()
          : const LobbyPage(),
      routes: <String, WidgetBuilder>{
        "/signin": (BuildContext context) => const SigninPage(),
        "/finished": (BuildContext context) => const FinishedPage(),
      },
    );
  }
}
