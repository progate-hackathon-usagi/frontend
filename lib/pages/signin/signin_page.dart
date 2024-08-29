import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/pages/signin/signin_viewmodel.dart';

class SigninPage extends ConsumerWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewmodel = ref.watch(SigninViewModelProvider.notifier);

    ref.listen(SigninViewModelProvider, (previousState, isSuccess) {
      if (isSuccess) viewmodel.navigateToLobby(context);
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Sign in"),
            ElevatedButton(
              onPressed: () {
                viewmodel.signIn();
              },
              child: const Text("Sign in with Google"),
            ),
          ],
        ),
      ),
    );
  }
}
