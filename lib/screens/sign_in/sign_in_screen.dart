import 'package:flutter/material.dart';
import 'package:sound_play/screens/sign_in/components/sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SignInForm(),
    );
  }
}
