import 'package:flutter/material.dart';
import 'package:workwaves/views/nav/profile.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      left: true,
      top: true,
      right: true,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(children: <Widget>[
            TextField(),
            TextField(),
            TextField(),
            TextField(),
          ]),
        ),
      ),
    );
  }
}
