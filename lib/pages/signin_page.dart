import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  String? _userId;

  @override
  void initState() {
    super.initState();

    supabase.auth.onAuthStateChange.listen((data) {
      setState(() {
        _userId = data.session?.user.id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Sign in"),
          ElevatedButton(
              onPressed: () async {
                const webClientId =
                    String.fromEnvironment('GOOGLE_OAUTH_WEB_CLIENT_ID');
                print(webClientId);

                final GoogleSignIn googleSignIn = GoogleSignIn(
                  serverClientId: webClientId,
                );
                final googleUser = await googleSignIn.signIn();
                if (googleUser == null) {
                  print('Sign in cancelled by user');
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

                Navigator.pushNamed(context, "/lobby");
              },
              child: Text("Sign in with Google"))
        ],
      )),
    );
  }
}
