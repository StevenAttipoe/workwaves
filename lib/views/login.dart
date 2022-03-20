import 'package:flutter/material.dart';
import 'package:workwaves/views/home.dart';
import 'package:workwaves/views/signup.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
            child: Column(children: [
              Text("Implement Code Here, Use buttons for navigation when testing"),

              ElevatedButton(
                onPressed: () {
                    Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(
                      builder: (context)=>Home()));
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black
                )),

              ElevatedButton(
                onPressed: () {
                    Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(
                      builder: (context)=>SignUp()));
                },
                child: Text('SignUp'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black
                ))
            ],)
            
          ),
    );
  }
}