import 'package:flutter/material.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xff99879D),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Back",
          style: TextStyle(color: Color(0xff99879D)),
        ),
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildComments(),
        ],
      ),
    );
  }

  Widget buildComments() => Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Kyle Wilson',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Awesome job!',
                    style: TextStyle(
                      color: Color(0xff99879D),
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text('Rating'),
                ],
              ),
            ],
          ),
        ),
      );
}