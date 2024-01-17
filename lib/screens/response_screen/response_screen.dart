import 'package:flutter/material.dart';
import 'package:sound_play/constants.dart';

class ResponseScreen extends StatelessWidget {
  static String routeName = 'response_screen';

  const ResponseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTextColorBlack,
      body: Center(
        child: Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: kTextColor, borderRadius: BorderRadius.circular(10)),
            width: double.infinity,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Email and password are incorrect',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kTextColorBlack),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        minimumSize: const Size(100, 48)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'OK',
                      style: textStyleBlack,
                    ))
              ],
            )),
      ),
    );
  }
}
