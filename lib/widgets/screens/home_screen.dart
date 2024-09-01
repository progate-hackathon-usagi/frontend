import 'package:flutter/material.dart';
import 'package:frontend/widgets/waiting_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;
    const headingTextStyle = TextStyle(fontSize: 36, color: Colors.black);

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              iconSize: 50,
              icon: Icon(Icons.logout),
              onPressed: () {
                supabase.auth.signOut();
                Navigator.pushNamed(context, '/signin');
              },
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              transform: const GradientRotation(45),
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue.withOpacity(0.4), // Sky blue
                const Color.fromARGB(255, 37, 33, 243)
                    .withOpacity(0.4), // Steel blue
              ],
            ),
          ),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                  colors: [Colors.purple, Colors.lightBlue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ElevatedButton(
                  onPressed: () {
                    // Add your action here
                    print('CTA button pressed!');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(149, 9, 98, 199),
                    shadowColor: const Color.fromARGB(148, 135, 247, 255),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child:
                      const Column(mainAxisSize: MainAxisSize.min, children: [
                    Text(
                      'ラジオ体操に参加する',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '592 人が参加中...',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ])),
            ),

            // child: ElevatedButton(
            //   onPressed: () {
            //     final supabase = Supabase.instance.client;
            //     final roomId = 'room1';
            //     final channel = supabase.channel(roomId,
            //         opts: const RealtimeChannelConfig(self: true));

            //     Navigator.of(context).push(
            //       MaterialPageRoute(
            //           builder: (context) =>
            //               WaitingPage(context: context, channel: channel)),
            //     );
            //   },
            //   child: const Column(
            //     mainAxisSize: MainAxisSize.min,
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       Text('ラジオ体操に', style: headingTextStyle),
            //       Text("参加する", style: headingTextStyle),
            //       SizedBox(height: 20),
            //       Text('212人が参加中...'),
            //     ],
            //   ),
            // ),
          ),
        ));
  }
}
