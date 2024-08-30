import 'package:flutter/material.dart';
import 'package:frontend/pages/waiting_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LobbyPage extends StatelessWidget {
  const LobbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
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
          IconButton(
            iconSize: 50,
            icon: Icon(Icons.logout),
            onPressed: () {
              supabase.auth.signOut();
              Navigator.pushNamed(context, '/signin');
            },
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final supabase = Supabase.instance.client;
            final roomId = 'room1';
            final channel = supabase.channel(roomId);

            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) =>
                      WaitingPage(context: context, channel: channel)),
            );
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
