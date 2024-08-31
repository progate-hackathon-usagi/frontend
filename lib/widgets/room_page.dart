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

  @override
  Widget build(BuildContext context) {
    _play();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await widget.channel.untrack();

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
