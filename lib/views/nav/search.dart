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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Search',
              style: TextStyle(
                color: Color(0x0E1C21),
                //color: Color(0xff100e0e),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            TextFormField(
              validator: ValidationBuilder().required().build(),
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            //filter icon
            //name with Icons
            //Results from search will be here
          ],
        ),
      ),
    ));
  }
}
