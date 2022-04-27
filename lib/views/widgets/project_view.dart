import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProjectView extends StatefulWidget {
  const ProjectView({Key? key}) : super(key: key);

  @override
  State<ProjectView> createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  @override
  Widget build(BuildContext context) {
    final projectToView =
        ModalRoute.of(context)!.settings.arguments as OneProject;
    String uid = FirebaseAuth.instance.currentUser!.uid.toString();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xff99879D),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Back",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 30,
                    child: Text(
                      projectToView.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 7),
                  Text(projectToView.description),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(2),
                                  ),
                                  border: Border.all(
                                    color: Colors.grey,
                                  )),
                              child: Text(
                                projectToView.tag1,
                                style: const TextStyle(fontSize: 15),
                              )),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(2)),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: Text(
                              projectToView.tag2,
                              style: const TextStyle(fontSize: 15),
                            )),
                        const Spacer(),
                        Text(
                          "Ghc" + projectToView.price.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      var document = FirebaseFirestore.instance;
                      document
                          .collection('project-info')
                          .doc(uid)
                          .collection('All-Projects')
                          .add({
                        'contact_name': projectToView.name,
                        'project_name': projectToView.description
                      });
                      showAddDialog(context, projectToView.name);
                    },
                    child: const Text('Add Gig'),
                    style: ElevatedButton.styleFrom(primary: Colors.black)),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text('Call'),
                    style: ElevatedButton.styleFrom(primary: Colors.black)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showAddDialog(context, String name) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Gig Added'),
          content: SingleChildScrollView(
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

class OneProject {
  final String name;
  final String description;
  final String price;
  final String tag1;
  final String tag2;

  OneProject(this.name, this.description, this.price, this.tag1, this.tag2);
}
