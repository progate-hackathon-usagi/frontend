import 'package:flutter/material.dart';
import 'package:frontend/widgets/room_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class WaitingPage extends StatefulWidget {
  final RealtimeChannel channel;
  const WaitingPage({super.key, required context, required this.channel});

  @override
  _WaitingPageState createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> {
  final List _users = [];

  @override
  void initState() {
    super.initState();

    final supabase = Supabase.instance.client;

    // イベントリスナを登録
    widget.channel
        // 参加イベント時の処理
        .onPresenceJoin((payload) {
      final newUserPayload = payload.newPresences.first.payload;
      final newUserId = newUserPayload['user_id'];
      if (_users.any((user) => user['user_id'] == newUserId)) return;
      final newUserStatus = {
        'user_id': newUserId,
        'name': newUserPayload['name'],
        'iconUrl': newUserPayload['iconUrl'],
      };
      _addUser(newUserStatus);

      // 退室イベント時の処理
    }).onPresenceLeave((payload) {
      final leftUserId = payload.leftPresences.first.payload['user_id'];
      _removeUser(leftUserId);

      // 参加イベントを発生させる（自分の参加を通知）
    }).subscribe((status, error) async {
      if (status != RealtimeSubscribeStatus.subscribed) return;

      // TODO: name, iconUrl を profile から拾ってくる
      // 本当は型指定したいけど、track にインスタンス渡すと怒られるので Map で渡してる
      final userStatus = {
        'user_id': supabase.auth.currentUser!.id,
        'name': "user",
        'iconUrl': "https://via.placeholder.com/350x350?text=sample",
      };

      final presenceTrackStatus = await widget.channel.track(userStatus);
      _addUser(userStatus);
    });
  }

  void _addUser(user) {
    setState(() {
      _users.add(user);
    });
  }

  void _removeUser(String id) {
    setState(() {
      _users.removeWhere((user) => user['user_id'] == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            widget.channel.untrack();
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(children: <Widget>[
          const Text("参加者"),
          Expanded(
            child: ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                final user = _users[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user['iconUrl']),
                  ),
                  title: Text(user['name']),
                );
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => RoomPage(channel: widget.channel)),
                );
              },
              child: const Text("ラジオ体操へ")),
          const SizedBox(height: 20),
        ]),
      ),
    );
  }
}
