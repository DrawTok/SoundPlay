
import 'package:flutter/material.dart';
import 'package:sound_play/screens/response_screen/response_screen.dart';
import 'screens/sign_in/sign_in_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SignInScreen.routeName: (context) => const SignInScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  ResponseScreen.routeName: (context) => const ResponseScreen()
};
