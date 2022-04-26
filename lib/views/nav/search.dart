import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workwaves/model/project_model.dart';
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
  String uid = FirebaseAuth.instance.currentUser!.uid.toString();

  // final CollectionReference _projects =
  //     FirebaseFirestore.instance.collection('Projects');
  final _projectSearch = FirebaseFirestore.instance;
  late List projectsData = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    QuerySnapshot querySnapshot =
        await _projectSearch.collection('Projects').get();

    setState(() {
      projectsData = querySnapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Text("Gigs Available",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                  ),),
                  const SizedBox(height: 10),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: projectsData.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            projectsData[index]['Name'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          subtitle: Text(projectsData[index]['Description']),
                          trailing: IconButton(
                              onPressed: () {
                               var document =  FirebaseFirestore.instance;
                                    document
                                    .collection('project-info')
                                    .doc(uid)
                                    .collection('All-Projects')
                                    .doc(uid)
                                    .set({
                                      'contact_name': projectsData[index]['Name'],
                                      'project_name': projectsData[index]['Description']
                                });
                                showAddDialog(context, projectsData[index]['Name']);
                              },
                              icon: const Icon(Icons.add)),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

   void showAddDialog(context,String name) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Gig Added'),
          content:  SingleChildScrollView(
            child: Text('You have successfully added the gig: ' + name),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Okay',
                style: TextStyle(color: Color(0xFFFFFFFF)),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
