import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
    final CollectionReference _projects = FirebaseFirestore.instance.collection('Projects');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Search',
              style: TextStyle(
                color: Color(0x0E1C21),
                //color: Color(0xff100e0e),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
             TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height:15),
                  StreamBuilder(
                      stream:  _projects.snapshots(),
                      builder: (context,AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                        if (streamSnapshot.hasData) {
                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: streamSnapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot documentSnapshot =
                                  streamSnapshot.data!.docs[index];
                              return ListTile(
                                  title: Text(
                                    documentSnapshot['Name'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                    ),),
                                  subtitle:Text(documentSnapshot['Description']),
                                  trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                                
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
            //filter icon
            //name with Icons
            //Results from search will be here
          ],
        ),
      ),
    ));
  }
}
