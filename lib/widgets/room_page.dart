import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/model/data/participant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:video_player/video_player.dart';

class RoomPage extends ConsumerStatefulWidget {
  final RealtimeChannel channel;

  const RoomPage({super.key, required this.channel});

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends ConsumerState<RoomPage> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset("assets/video/exercise.mp4")
      ..initialize().then((_) {
        if (!mounted) return;
        setState(() {});
        _videoController.play();

        // ビデオが終了した際の処理
        _videoController.addListener(() {
          if (_videoController.value.position >=
              _videoController.value.duration) {
            _videoController.pause();
            _logExercise();
            Navigator.pushNamed(context, "/finished");
          }
        });
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  void _logExercise() async {
    final supabase = Supabase.instance.client;
    supabase.functions.invoke("exercise", body: {
      "user_id": supabase.auth.currentUser!.id,
      "timestamp": DateTime.now().toIso8601String(),
    });
  }

  @override
  Widget build(BuildContext context) {
    final participants = ref.watch(participantsProvider);

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: [
              AspectRatio(
                  aspectRatio: _videoController.value.aspectRatio,
                  child: VideoPlayer(_videoController)),
              VideoProgressIndicator(_videoController, allowScrubbing: false)
            ],
          ),

          // 参加者一覧
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // 一列に4人表示
              ),
              itemCount: participants.length,
              itemBuilder: (context, index) {
                final participant = participants[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(participant.iconUrl),
                      radius: 30,
                    ),
                    const SizedBox(height: 8),
                    Text(participant.name,
                        style: const TextStyle(fontSize: 12)),
                  ],
                );
              },
            ),
          ),

          Center(
            child: ElevatedButton(
              onPressed: () async {
                _videoController.pause();
                _logExercise();
                await widget.channel.untrack();

                if (!context.mounted) return;
                Navigator.pushNamed(context, "/finished");
              },
              // for debug
              child: const Text("ラジオ体操を終了する"),
            ),
          ),
        ],
      ),
    ));
  }
}
