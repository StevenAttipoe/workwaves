import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:workwaves/views/nav/chat.dart';
import 'package:workwaves/views/nav/profile.dart';
import 'package:workwaves/views/nav/resume.dart';
import 'package:workwaves/views/nav/search.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:workwaves/views/subpages/view_project.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final CollectionReference _projects =
      FirebaseFirestore.instance.collection('Projects');
  TextEditingController _searchController = TextEditingController();
  List<String> glossarList =
//list to hold all projects in the database
      [];

  List<String> glossarListOnSearch = [];

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('Projects');
  //converting to list 1
  Future<List<Object?>> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    //print(allData);
    return allData;
  }

  //converting to lists 2
  getSearchItems(AsyncSnapshot<QuerySnapshot> snapshot) {
    final projectData = snapshot.data?.docs
        .map((doc) => new ListTile(
            title: new Text(doc["Name"]),
            subtitle: new Text(doc["Title"].toString())))
        .toList();

    return projectData;
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
            Row(children: const <Widget>[
              const Text(
                'Search',
                style: TextStyle(
                  color: Colors.black,
                  //color: Color(0xff100e0e),
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
            const SizedBox(height: 20),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  /* stream:_projects.snapshots();
                  glossarListOnSearch = getSearchItems().where((element) =>
                      element.toLowerCase().contains(value.toLowerCase()));*/
                });
              },
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  StreamBuilder(
                      stream: _projects.snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                        if (streamSnapshot.hasData) {
                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: streamSnapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot documentSnapshot =
                                  streamSnapshot.data!.docs[index];

                              return ListTile(
                                title: TextButton(
                                  onPressed: () {
                                    /* react to the tile being pressed */
                                    //Navigator.pushNamed(context, '/SearchPage');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ViewProject()),
                                    );
                                  },
                                  child: Text(
                                    documentSnapshot['Name'],
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                subtitle: Text(
                                  documentSnapshot['Description'],
                                ),
                                trailing: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add)),
                              );
                            },
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
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
}
