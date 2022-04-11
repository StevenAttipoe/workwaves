import 'package:flutter/material.dart';
import 'package:workwaves/views/home.dart';
import 'package:form_validator/form_validator.dart';
import 'package:workwaves/views/loginScreen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

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
          context, MaterialPageRoute(builder: (context) => LoginScreen())),
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
  GlobalKey<FormState> _form = GlobalKey<FormState>();

  void _validate() {
    /*how to handle that: are you 100% sure that in this case "_formKey.currentState" CAN'T ever be null
    telling by hand the compiler that calling "validate" method is completely safe at this point*/
    _form.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    RegExp exp =
        RegExp("^(?=.*[A-Za-z])(?=.*\d)(?=.*[@!%.*#?&])[A-Za-z\d@!%*#?&]{8,}");
    String str =
        "Must include alphanumeric and symbol and atleast 8 characters";

    return Scaffold(
      body: Form(
        key: _form,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                'Sign-Up',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50),
              TextFormField(
                validator: ValidationBuilder()
                    .minLength(5)
                    .maxLength(50)
                    .required()
                    .build(),
                decoration: InputDecoration(
                  labelText: 'Name',
                  filled: true,
                  helperText: 'Min length: 5, max length: 50',
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: ValidationBuilder()
                    .minLength(8)
                    .maxLength(20)
                    .regExp(exp, str)
                    .required()
                    .build(),
                /*validator: requiredValidator,*/

                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  helperText:
                      'Min length: 6, max length: 16, Must contain a symbol or number',
                ),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: ValidationBuilder()
                    .email()
                    .maxLength(50)
                    .required()
                    .build(),
                decoration: InputDecoration(
                  labelText: 'Email',
                  filled: true,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: ValidationBuilder().phone().maxLength(10).build(),
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  filled: true,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                ),
              ),
              SizedBox(height: 30),
              buildLoginBtn(context),
            ],
          ),
        ),
      ),

      /*floatingActionButton: FloatingActionButton(
        */ /* tooltip: 'Next',*/ /*
        child: Text('Sign-Up'),
        onPressed: () {
          _validate();

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
        },
      ),*/
      /*ElevatedButton: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
          child: Text('Sign-Up'),
          style: ElevatedButton.styleFrom(primary: Colors.black)),*/
    );
  }
}
