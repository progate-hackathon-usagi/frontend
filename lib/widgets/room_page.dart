import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RoomPage extends StatefulWidget {
  final RealtimeChannel channel;

  const RoomPage({super.key, required this.channel});

  @override
  _RoomPageState createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  late AudioCache _audioCache;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioCache = AudioCache(prefix: "assets/audio/");
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _stop();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _play() async {
    try {
      final url = "audio/exercise.mp3";
      await _audioPlayer.play(AssetSource(url));
    } catch (e) {
      print("Error: $e");
    }
  }

  void _stop() async {
    await _audioPlayer.stop();
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
    _play();
    _audioPlayer.onPlayerComplete.listen((event) {
      _logExercise();
      if (!context.mounted) return;
      Navigator.pushNamed(context, "/finished");
    });

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("ここにいい感じのガイドを表示する"),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                _stop();
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
    );
  }
}
