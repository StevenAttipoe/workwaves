import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:workwaves/views/nav/chat.dart';
import 'package:workwaves/views/nav/profile.dart';
import 'package:workwaves/views/nav/resume.dart';
import 'package:workwaves/views/nav/search.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  get prefixIcon => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              validator: ValidationBuilder().required().build(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                labelText: 'Search',
              ),
            ),

            //filter icon
            Text(
              "Filters",
              style: TextStyle(
                color: Colors.black,
              ),
              textAlign: TextAlign.left,
            ),
            //name with Icons
            //Results from search will be here
            SizedBox(height: 50),
            Text(
              "Create an Application",
              style: TextStyle(
                decorationColor: Colors.black,
                color: Colors.black,
                //color: Color(0xff100e0e),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            Text(
              "Description",
              style: TextStyle(
                color: Colors.black,
                //color: Color(0xff100e0e),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            Text(
              "We are a young startup from Paris "
              "looking for a designer who can help us "
              "design a tech oriented application."
              " We are open to proposals.",
              style: TextStyle(
                color: Colors.black,
                //color: Color(0xff100e0e),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
