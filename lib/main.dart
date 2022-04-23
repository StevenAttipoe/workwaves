import 'package:flutter/material.dart';
import 'package:workwaves/views/splash_screen.dart';

void main()  {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' WorkWaves',
      home:  Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// flutter run