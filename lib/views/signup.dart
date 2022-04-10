import 'package:flutter/material.dart';
import 'package:workwaves/views/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
            child:  Column(
              children: [
                Text("SignUp!"),

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
                )
              )],    
            )
          ),
    );
  }
}