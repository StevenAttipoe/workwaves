import 'package:flutter/material.dart';
import 'package:workwaves/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' WorkWaves',
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// flutter run
