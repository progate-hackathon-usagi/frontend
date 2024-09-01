import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gathercise/widgets/lobby_page.dart';
import 'package:gathercise/widgets/signin/signin_viewmodel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class SigninPage extends ConsumerWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = ref.watch(SigninViewModelProvider.notifier);
    final state = ref.watch(SigninViewModelProvider);

    if (state) {
      return const LobbyPage();
    }

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Sign in"),
          ElevatedButton(
            onPressed: () async {
              viewmodel.signIn(context);
            },
            child: const Text("Sign in with Google"),
          )
        ],
      )),
    );
  }
}
