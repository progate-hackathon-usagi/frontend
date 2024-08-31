import 'package:flutter/material.dart';
import 'package:frontend/model/data/participant.dart';
import 'package:frontend/widgets/room_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class WaitingPage extends StatefulWidget {
  final RealtimeChannel channel;
  const WaitingPage({super.key, required context, required this.channel});

  @override
  _WaitingPageState createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> {
  final List<Participant> _participants = [];

  @override
  void initState() {
    super.initState();

    final supabase = Supabase.instance.client;

    // イベントリスナを登録
    widget.channel
        // 参加イベント時の処理
        .onPresenceJoin((payload) {
          final newUserId = payload.newPresences.first.payload['user_id'];
          if (_participants.any((user) => user.user_id == newUserId)) return;

          final participant =
              Participant.fromJson(payload.newPresences.first.payload);
          _joinParticipant(participant);
        })

        // 退室イベント時の処理
        .onPresenceLeave((payload) {
          final leftUserId = payload.leftPresences.first.payload['user_id'];
          _removeUser(leftUserId);
        })

        // イベントの開始を通知
        .onBroadcast(
            event: "start",
            callback: (payload) {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => RoomPage(channel: widget.channel)),
              );
            })

        // 参加イベントを発生させる（自分の参加を通知）
        .subscribe((status, error) async {
          if (status != RealtimeSubscribeStatus.subscribed) return;

          final currentUser = Participant(
              user_id: supabase.auth.currentUser!.id,
              name: "user",
              iconUrl: "https://via.placeholder.com/350x350?text=sample");

          final presenceTrackStatus =
              await widget.channel.track(currentUser.toJson());
          _joinParticipant(currentUser);
        });
  }

  void _joinParticipant(Participant user) {
    setState(() {
      _participants.add(user);
    });
  }

  void _removeUser(String id) {
    setState(() {
      _participants.removeWhere((user) => user.user_id == id);
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
              itemCount: _participants.length,
              itemBuilder: (context, index) {
                final participant = _participants[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(participant.iconUrl),
                  ),
                  title: Text(participant.name),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: ラジオ体操の開始を broadcast
              widget.channel.sendBroadcastMessage(
                event: "start",
                payload: {"message": "start"},
              );

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RoomPage(channel: widget.channel),
                ),
              );
            },
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('ラジオ体操を始める'),
                const Text("(ルームに参加している全員が開始されます)",
                    style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ]),
      ),
    );
  }
}
