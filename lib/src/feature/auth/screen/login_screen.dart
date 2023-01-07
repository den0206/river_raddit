import 'package:flutter/material.dart';
import 'package:river_raddit/src/core/common/sigin_in_button.dart';
import 'package:river_raddit/src/core/constants/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          Constants.logoPath,
          height: 40,
        ),
        actions: [
          TextButton(
            child: const Text(
              "Skip",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(children: [
        const SizedBox(
          height: 30,
        ),
        const Text(
          "Dive int Anything",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            Constants.logoEmotePath,
            height: 400,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const SignInButton()
      ]),
    );
  }
}
