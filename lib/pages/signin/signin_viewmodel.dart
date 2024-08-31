import 'package:flutter/material.dart';
import 'package:frontend/pages/screens/tab_bar.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final SigninViewModelProvider = StateNotifierProvider<SigninViewModel, bool>(
  (ref) => SigninViewModel(false),
);

class SigninViewModel extends StateNotifier<bool> {
  final supabase = Supabase.instance.client;
  final webClientId =
      const String.fromEnvironment('GOOGLE_OAUTH_WEB_CLIENT_ID');

  SigninViewModel(super.state);

  void listenToStateChanges(BuildContext context) {
    addListener((state) {
      if (state) {
        navigateToLobby(context);
      }
    });
  }

  Future<void> signIn(BuildContext context) async {
    listenToStateChanges(context);

    final GoogleSignIn googleSignIn = GoogleSignIn(
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

    //ログインの状態をtrueにする。
    state = true;
  }

  void navigateToLobby(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TabBarWidget(),
      ),
    );
  }
}
