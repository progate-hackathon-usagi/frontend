import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:video_player/video_player.dart';

class RoomPage extends StatefulWidget {
  final RealtimeChannel channel;

  const RoomPage({super.key, required this.channel});

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset("assets/video/exercise.mp4")
      ..initialize().then((_) {
        if (!mounted) return;
        setState(() {});
        _videoController.play();
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
