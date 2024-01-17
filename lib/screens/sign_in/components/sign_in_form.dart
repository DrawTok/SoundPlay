import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sound_play/constants.dart';
import 'package:sound_play/helpers/keyboard.dart';
import 'package:sound_play/screens/response_screen/response_screen.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<StatefulWidget> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool hasEmail = false, hasPassword = false;

  bool isFullInformation = false;

  void checkFullForm() {
    setState(() {
      if (hasEmail && hasPassword) {
        isFullInformation = true;
      } else {
        isFullInformation = false;
      }
    });
  }

  void signIn() async {
    KeyBoardUntil.hideKeyBoard(context);
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: password!);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? 'Authentication failed.')));
    } finally {
      Navigator.pushNamed(context, ResponseScreen.routeName);
    }
  }

  @override
  void dispose() {
    _formKey.currentState!.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                onSaved: (newValue) => email = newValue,
                validator: (value) {
                  if (value!.isEmpty) {
                    return kEmailNullError;
                  } else if (!emailValidatorRegExp.hasMatch(value)) {
                    return kInvalidEmailError;
                  }
                  return null;
                },
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    hasEmail = true;
                  } else {
                    hasEmail = false;
                  }
                  checkFullForm();
                },
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                onSaved: (newValue) => password = newValue,
                validator: (value) {
                  if (value!.isEmpty) {
                    return kPassNullError;
                  }
                  return null;
                },
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    hasPassword = true;
                  } else {
                    hasPassword = false;
                  }
                  checkFullForm();
                },
                decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: Icon(Icons.remove_red_eye)),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: isFullInformation ? signIn : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isFullInformation ? kTextColor : kBorderColor,
                  ),
                  child: Text(
                    'Sign in',
                    style: isFullInformation ? textStyleBlack : textStyle,
                  ))
            ],
          ),
        ));
  }
}
