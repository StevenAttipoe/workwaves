import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workwaves/views/home.dart';
import 'package:workwaves/views/loginScreen.dart';
import 'package:workwaves/views/widgets/login_widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}


class _SignUpState extends State<SignUp> {
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color(0xffFFFFFF),
                      Color(0xffFFFFFF),
                      Color(0xffFFFFFF),
                      Color(0xffFFFFFF),
                    ])),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/icons/workwaves.png',
                      ),
                      const Text(
                        'Sign-Up',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      buildEmail(),
                      const SizedBox(height: 10),
                      buildPassword(),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 25),
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => print('Signup Pressed'),
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(5),
                            padding:MaterialStateProperty.all(const EdgeInsets.all(15,)),
                            backgroundColor: MaterialStateProperty.all(Color(0xff120E21)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>
                            (RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              )
                            )),
                          child: const Text(
                            'SIGN UP',
                            style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ), 
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => LoginScreen()));
                        },
                        child: RichText(
                          text: const TextSpan(children: [
                            TextSpan(
                              text: 'Already have an Account? ',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                                text: 'Log In',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold))
                          ]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}