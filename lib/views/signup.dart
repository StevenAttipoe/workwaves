import 'package:flutter/material.dart';
import 'package:workwaves/views/home.dart';
import 'package:form_validator/form_validator.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
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
              TextFormField(
                validator: ValidationBuilder()
                    .minLength(5)
                    .maxLength(50)
                    .required()
                    .build(),
                decoration: InputDecoration(
                  labelText: 'Name',
                  helperText: 'Min length: 5, max length: 50',
                ),
              ),
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
                  helperText:
                      'Min length: 6, max length: 16, Must contain a symbol or number',
                ),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
              TextFormField(
                validator: ValidationBuilder()
                    .email()
                    .maxLength(50)
                    .required()
                    .build(),
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.text,
              ),
              TextFormField(
                validator: ValidationBuilder().phone().maxLength(10).build(),
                decoration: InputDecoration(labelText: 'Phone Number'),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        /* tooltip: 'Next',*/
        child: Text('Sign-Up'),
        onPressed: () {
          _validate();

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
        },
      ),
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
