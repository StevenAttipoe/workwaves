import 'package:flutter/material.dart';
import 'package:workwaves/views/nav/profile.dart';
import 'package:workwaves/views/nav/resume.dart';
import 'package:workwaves/views/nav/search.dart';
import 'package:workwaves/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:workwaves/views/widgets/project_view.dart';
import 'package:workwaves/views/map/map.dart';

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
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => Splash(),
        '/project': (context) => const ProjectView(),
        '/search': (context) => const SearchPage(),
        '/map': (context) =>  const Map(),
        '/profile': (context) => const ProfilePage(),
        '/resume': (context) => const ResumePage(),
      },
    );
  }
}

// flutter run
