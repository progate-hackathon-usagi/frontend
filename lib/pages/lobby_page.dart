import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
            final supabase = Supabase.instance.client;
            final roomId = 'room1';
            final channel = supabase.channel(roomId);

            // イベントリスナを登録
            channel.onPresenceJoin((payload) {
              // TODO: 参加者一覧に追加
            }).onPresenceLeave((payload) {
              // TODO: 参加者一覧から削除
            }).subscribe();

            // presence を登録
            final userStatus = {
              'user_id': supabase.auth.currentUser!.id,
            };
            channel.subscribe((status, error) async {
              if (status != RealtimeSubscribeStatus.subscribed) return;
              await channel.track(userStatus);
            });

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
