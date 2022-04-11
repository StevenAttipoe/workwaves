import 'package:flutter/material.dart';
import 'package:workwaves/views/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

Widget buildLoginBtn(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: RaisedButton(
      elevation: 5,
      onPressed: () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home())),
      //print('Signup pressed'),
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      // RoundedRectangleBorder
      color: Color(0xff120E21),
      child: Text(
        'Sign Up',
        style: TextStyle(
          color: Color(0xffFFFFFF),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ), // RaisedButton
  );
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