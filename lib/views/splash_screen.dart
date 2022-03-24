import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:workwaves/views/login.dart';
=======
import 'loginScreen.dart';
>>>>>>> r_branch
import 'package:splashscreen/splashscreen.dart';
import 'package:workwaves/views/login.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() async {
    await Future.delayed(Duration(seconds: 2), () {});
    Navigator.pushReplacement(
<<<<<<< HEAD
      context, 
      MaterialPageRoute(
        builder: (context)=>Login()));
=======
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
>>>>>>> r_branch
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return 
      new SplashScreen(
        seconds: 10,
        image: new Image.asset('assets/icons/workwaves.png'),
        backgroundColor: Colors.white,
        photoSize: 200.0,
        loaderColor: Colors.black,);
    
=======
    return new SplashScreen(
      seconds: 10,
      image: new Image.asset('assets/icons/workwaves.png'),
      backgroundColor: Colors.white,
      photoSize: 200.0,
      loaderColor: Colors.black,
    );
>>>>>>> r_branch
  }
}
