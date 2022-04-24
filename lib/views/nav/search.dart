import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:workwaves/views/nav/chat.dart';
import 'package:workwaves/views/nav/profile.dart';
import 'package:workwaves/views/nav/resume.dart';
import 'package:workwaves/views/nav/search.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.search_outlined, color: Colors.white70),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Card(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Search...'),
            onChanged: (val) {
              setState(() {
                title = val;
              });
            },
          ),
          // Text('Seach');
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: (title != "" && title != null)
            ? FirebaseFirestore.instance
                .collection('Projects')
                .where("Title", arrayContains: title)
                .snapshots()
            : FirebaseFirestore.instance.collection("Projects").snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data =
                        snapshot.data?.docs[index] as DocumentSnapshot<Object?>;
                    return Card(
                      child: Row(
                        children: <Widget>[
                          Text(
                            data['Name'],
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Text(
                            data['Title'],
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}

//return Scaffold(
/* body: SafeArea(
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
            Row(children: <Widget>[
              const Icon(
                Icons.filter_list,
                size: 40,
              )
            ]),

            //,

            */ /*Container(
              color: Color(0xffEFEDF0),
              height: 80,
              child: Row(children: <Widget>[
                Icon(
                  CupertinoIcons.tortoise_fill,
                  size: 30,
                ),
                const Text("Chasya Abakah",
                    style: TextStyle(color: Colors.black, fontSize: 25)),
              ]),
            ),*/ /*
          ],
        ),
      ),
    ));
  }
}*/

/*class Gigs {
  final String title;
  final String name;
  final String description;

  Gigs.fromDocumet(DocumentSnapshot documentSnapshot) {
    return Gigs(
        title: documentSnapshot['Title'],
        name: documentSnapshot['Name'],
        description: documentSnapshot['Description']);
  }

  @override
  String toString() {
    return 'Title: $title, Name: $name, Description: $description';
  }
}*/
