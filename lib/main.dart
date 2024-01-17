import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sound_play/firebase_options.dart';
import 'package:sound_play/screens/chose_sign/choose_sign_screen.dart';
import 'package:sound_play/theme.dart';
import 'routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // Đảm bảo Flutter đã được khởi tạo
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SoundPlay',
      theme: AppTheme.lightTheme(context),
      home: const ChoseSignScreen(),
      routes: routes,
    );
  }
}
