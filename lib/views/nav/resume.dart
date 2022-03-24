import 'package:flutter/material.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
            child: const Text("Resume"),
          ),
    );
  }
}