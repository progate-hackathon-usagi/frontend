import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/widgets/lobby_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Sign in"),
          ElevatedButton(
              onPressed: () async {
                final GoogleSignIn googleSignIn;
                const webClientId =
                    String.fromEnvironment('GOOGLE_OAUTH_WEB_CLIENT_ID');
                const iosClientId =
                    String.fromEnvironment('GOOGLE_OAUTH_IOS_CLIENT_ID');
                googleSignIn = GoogleSignIn(
                  clientId: iosClientId,
                  serverClientId: webClientId,
                );

                final googleUser = await googleSignIn.signIn();
                if (googleUser == null) {
                  return;
                }

                final googleAuth = await googleUser.authentication;
                final accessToken = googleAuth.accessToken;
                final idToken = googleAuth.idToken;

                if (accessToken == null) {
                  throw 'No Access Token found.';
                }
                if (idToken == null) {
                  throw 'No ID Token found.';
                }

                await supabase.auth.signInWithIdToken(
                  provider: OAuthProvider.google,
                  idToken: idToken,
                  accessToken: accessToken,
                );

                if (supabase.auth.currentUser == null) {
                  throw 'Failed to sign in with Google';
                }

                if(!context.mounted) {
                  return;
                }
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LobbyPage(),
                  ),
                );
              },
              child: const Text("Sign in with Google"))
        ],
      )),
    );
  }
}
