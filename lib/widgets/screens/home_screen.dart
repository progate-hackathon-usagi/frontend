import 'package:flutter/material.dart';
import 'package:frontend/widgets/waiting/waiting_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    const headingTextStyle = TextStyle(fontSize: 36, color: Colors.black);

    return Scaffold(
      appBar: AppBar(
        actions: [
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
            final channel = supabase.channel(
              roomId,
              opts: const RealtimeChannelConfig(
                self: true
              )
            );

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
