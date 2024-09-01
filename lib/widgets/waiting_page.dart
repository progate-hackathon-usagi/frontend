import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gathercise/model/data/participant.dart';
import 'package:gathercise/model/data/user_profile.dart';
import 'package:gathercise/widgets/room_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class WaitingPage extends ConsumerStatefulWidget {
  final RealtimeChannel channel;
  const WaitingPage({super.key, required context, required this.channel});

  @override
  _WaitingPageState createState() => _WaitingPageState();
}

class _WaitingPageState extends ConsumerState<WaitingPage> {
  @override
  void initState() {
    super.initState();

    final supabase = Supabase.instance.client;

    // 参加イベント時の処理
    widget.channel
        .onPresenceJoin((payload) {
          final participants = ref.watch(participantsProvider);
          final newUserId = payload.newPresences.first.payload['user_id'];
          if (participants.any((user) => user.user_id == newUserId)) return;

          final participant =
              Participant.fromJson(payload.newPresences.first.payload);
          ref.read(participantsProvider.notifier).addParticipant(participant);
        })

        // 退室イベント時の処理
        .onPresenceLeave((payload) {
          final leftUserId = payload.leftPresences.first.payload['user_id'];
          ref.read(participantsProvider.notifier).removeParticipant(leftUserId);
        })

        // イベントの開始を通知
        .onBroadcast(
          event: "start",
          callback: (payload) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => RoomPage(channel: widget.channel),
              ),
            );
          },
        )

        // 参加イベントを発生させる（自分の参加を通知）
        .subscribe((status, error) async {
          if (status != RealtimeSubscribeStatus.subscribed) return;

          final userId = supabase.auth.currentUser!.id;
          final profile = await UserProfile.fetch(userId);
          final iconUrl = profile.getIconURL();

          final currentUser = Participant(
              user_id: userId, name: profile.name, iconUrl: iconUrl);
          await widget.channel.track(currentUser.toJson());
          ref.read(participantsProvider.notifier).addParticipant(currentUser);
        });
  }

  @override
  Widget build(BuildContext context) {
    final participants = ref.watch(participantsProvider);
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
              itemCount: participants.length,
              itemBuilder: (context, index) {
                final participant = participants[index];
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
                widget.channel.sendBroadcastMessage(
                  event: "start",
                  payload: {"message": "start"},
                );
              },
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('ラジオ体操を始める'),
                  Text("(ルームに参加している全員が開始されます)", style: TextStyle(fontSize: 12)),
                ],
              )),
          const SizedBox(height: 20),
        ]),
      ),
    );
  }
}
