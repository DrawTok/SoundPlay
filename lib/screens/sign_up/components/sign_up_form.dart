import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sound_play/constants.dart';
import 'package:sound_play/helpers/keyboard.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<StatefulWidget> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? confirmPassword;
  bool isMatch = false;

  void isMatchPassword() {
    if (password == null || confirmPassword == null) {
      return;
    }

    if (password!.length == confirmPassword!.length) {
      isMatch = password == confirmPassword;
    }
  }

  void registerAccount() {
    if (!formKey.currentState!.validate() || !isMatch) {
      return;
    }
    formKey.currentState!.save();
    KeyBoardUntil.hideKeyBoard(context);

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }

  @override
  void dispose() {
    formKey.currentState!.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
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
                decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    floatingLabelBehavior: FloatingLabelBehavior.always),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                onSaved: (newValue) => password = newValue,
                validator: (value) {
                  if (value!.isEmpty) {
                    return kPassNullError;
                  } else if (value.length < 8) {
                    return kShortPassError;
                  }
                  return null;
                },
                onChanged: (value) {
                  password = value;
                  isMatchPassword();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  hintText: 'Enter your password',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return kPassNullError;
                  } else if (value.length < 8) {
                    return kShortPassError;
                  }
                  return null;
                },
                onChanged: (value) {
                  confirmPassword = value;
                  isMatchPassword();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: registerAccount,
                child: const Text('Sign up'),
              ),
            ],
          ),
        ));
  }
}
