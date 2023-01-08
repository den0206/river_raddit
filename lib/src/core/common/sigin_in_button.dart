import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_raddit/src/core/constants/constants.dart';
import 'package:river_raddit/src/feature/auth/controller/auth_controller.dart';
import 'package:river_raddit/src/theme/pallete.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({super.key});

  Future<void> signInWithGoogle(BuildContext context, WidgetRef ref) async {
    await ref.read(authControllerProvider.notifier).signInWithGoogle(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            backgroundColor: Pallete.greyColor,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )),
        icon: Image.asset(
          Constants.googlePath,
          width: 35,
        ),
        label: const Text(
          "Continue With Google",
          style: TextStyle(fontSize: 18),
        ),
        onPressed: () async {
          await signInWithGoogle(context, ref);
        },
      ),
    );
  }
}
