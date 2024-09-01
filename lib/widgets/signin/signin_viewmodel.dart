import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:gathercise/widgets/lobby_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final SigninViewModelProvider = StateNotifierProvider<SigninViewModel, bool>(
  (ref) => SigninViewModel(false),
);

class SigninViewModel extends StateNotifier<bool> {
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

    final GoogleSignIn googleSignIn;
    final supabase = Supabase.instance.client;
    const webClientId = String.fromEnvironment('GOOGLE_OAUTH_WEB_CLIENT_ID');
    const iosClientId = String.fromEnvironment('GOOGLE_OAUTH_IOS_CLIENT_ID');
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

    final res = await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );

    if (res.user?.identities?.length == 0) {
      print("new user");
      await createUserProfile();
    }

    if (supabase.auth.currentUser == null) {
      throw 'Failed to sign in with Google';
    }

    //ログインの状態をtrueにする。
    state = true;
  }

  void navigateToLobby(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LobbyPage(),
      ),
    );
  }

  Future<void> createUserProfile() async {
    final supabase = Supabase.instance.client;
    final userId = supabase.auth.currentUser!.id;

    try {
      final wordPair = WordPair.random();
      supabase.functions.invoke(
        'profile/$userId',
        method: HttpMethod.post,
        body: {
          'id': userId,
          'username': wordPair.asCamelCase,
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
