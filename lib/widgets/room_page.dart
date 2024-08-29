import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RoomPage extends StatelessWidget {
  final RealtimeChannel channel;

  const RoomPage({super.key, required this.channel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await channel.untrack();

            if (!context.mounted) return;
            Navigator.pushNamed(context, "/finished");
          },
          // for debug
          child: const Text("ラジオ体操を終了する"),
        ),
      ),
    );
  }
}
