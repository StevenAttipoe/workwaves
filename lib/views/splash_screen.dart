import 'package:flutter/material.dart';
import 'loginScreen.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:workwaves/views/loginScreen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() async {
    await Future.delayed(Duration(seconds: 2), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 10,
      image: new Image.asset('assets/icons/workwaves.png'),
      backgroundColor: Colors.white,
      photoSize: 200.0,
      loaderColor: Colors.black,
    );
  }
}
