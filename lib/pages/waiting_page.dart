import 'package:flutter/material.dart';
import 'package:frontend/pages/room_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class WaitingPage extends StatelessWidget {
  final RealtimeChannel channel;
  const WaitingPage({super.key, required context, required this.channel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            channel.untrack();
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => RoomPage(channel: channel)),
              );
            },
            child: const Text("ラジオ体操へ")),
      ),
    );
  }
}
