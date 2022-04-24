import 'package:flutter/cupertino.dart';
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
  final CollectionReference _projectss =
      FirebaseFirestore.instance.collection('Projects');
  //TextEditingController _searchController = TextEditingController();

  List _allResults = [];

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
  }

  initializeAppFirebase() async {
    await Firebase.initializeApp();
  }

  get prefixIcon => null;

  /*getSearchitem() async {
    final uid = await Provider.of(context).auth.getCurrentUID();
    var data = await Firestore.instance
        .collection('userData')
        .documentation(uid)
        .collection('name')
        .collection('title')
        .collection('description')
        .getDocuments();

    setState(() {
      _allResults = data.documents;
    });
  searchResultsList();
    return "complete" */ /*data.documents*/ /*;
  }*/

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
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                labelText: 'Search',
              ),
            ),
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  setState(() {});
                  StreamBuilder(
                    stream: _projectss.snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      if (streamSnapshot.hasData) {
                        return ListView.builder(
                          itemCount: streamSnapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot documentSnapshot =
                            streamSnapshot.data!.docs[index];
                            return Card(
                              margin: const EdgeInsets.all(10),
                              child: ListTile(
                                title: Text(documentSnapshot['Title']),
                                subtitle: Text(documentSnapshot['Name']),
                                trailing: SizedBox(
                                  width: 100,
                                ),
                              ),
                            );
                          },
                        );
                      }

                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  )
                }),

            //filter icon
            Row(children: <Widget>[
              const Icon(
                Icons.filter_list,
                size: 40,
              )
            ]),

            //,

            /*Container(
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
            ),*/
          ],
        ),
      ),
    ));
  }
}
