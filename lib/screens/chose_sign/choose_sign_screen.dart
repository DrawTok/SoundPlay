import 'package:flutter/material.dart';
import 'package:sound_play/constants.dart';
import 'package:sound_play/screens/sign_in/sign_in_screen.dart';
import 'package:sound_play/screens/sign_up/sign_up_screen.dart';

class ChoseSignScreen extends StatelessWidget {
  const ChoseSignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Hàng triệu bài hát.\nMiễn phí trên SoundPlay.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: kTextColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          side: const BorderSide(color: Colors.transparent)),
                      onPressed: () {
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      },
                      child: const Text(
                        'Free sign up',
                        style: TextStyle(
                            fontSize: 18, color: Colors.black, height: 1.2),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/google.png',
                              width: 36,
                              height: 36,
                            ),
                            const Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Sign in with Google',
                                  style: textStyle,
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/facebook.png',
                              width: 36,
                              height: 36,
                            ),
                            const Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Sign in with Facebook',
                                  style: textStyle,
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                      child: const Text(
                        'Sign in',
                        style: textStyle,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
