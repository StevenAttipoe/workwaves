import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workwaves/model/project_model.dart';
import 'package:workwaves/views/nav/chat.dart';
import 'package:workwaves/views/nav/profile.dart';
import 'package:workwaves/views/nav/resume.dart';
import 'package:workwaves/views/nav/search.dart';
import 'package:workwaves/views/widgets/project_view.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _projectSearch = FirebaseFirestore.instance;
  late List projectsData = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void dispose() {
    super.dispose();
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
    double height = MediaQuery.of(context).size.height;
    String searchString = "";
    List<dynamic> items = [];

  void filterSearchResults(String query) {
    
    List<dynamic> dummySearchList = [];
    dummySearchList.addAll(projectsData);
    if(query.isNotEmpty) {
      List<dynamic> dummyListData =[];
      dummySearchList.forEach((item) {
        if(item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(projectsData);
      });
    }
  }

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
                  const Text(
                    "Gigs Available",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Row(
                    children:  [
                      Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric( vertical: 16),
                          child: TextField(
                            onChanged: (value) {
                              filterSearchResults(value);
                            },
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                ),
                                hintText: 'Search',
                                suffixIcon: Icon(Icons.search,size: 37),
                          )
                        ),
                        ),
                      ),
                    ]
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: projectsData.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/project',
                              arguments: 
                                OneProject(
                                  projectsData[index]['Name'].toString(),
                                  projectsData[index]['Description'].toString(),
                                  projectsData[index]['Price'].toString(),
                                  projectsData[index]['tag1'].toString(),
                                  projectsData[index]['tag2'].toString()
                                )
                            );
                          },
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 30,
                                  child: Text(
                                    projectsData[index]['Name'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Description",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 7),
                                Text(projectsData[index]['Description'],
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(2),
                                                ),
                                                border: Border.all(
                                                  color: Colors.grey,
                                                )),
                                            child: Text(
                                              projectsData[index]['tag1'],
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            )),
                                      ),
                                      Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(2)),
                                              border: Border.all(
                                                color: Colors.grey,
                                              )),
                                          child: Text(
                                            projectsData[index]['tag2'],
                                            style:
                                                const TextStyle(fontSize: 15),
                                          )),
                                      const Spacer(),
                                      Text(
                                        "Ghc" +
                                            projectsData[index]['Price']
                                                .toString(),
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
                        );
                      }),
                  Center(
                      child: projectsData.isEmpty == true
                          ? Padding(
                              padding: EdgeInsets.only(top: height * 0.4),
                              child: const CircularProgressIndicator(),
                            )
                          : null),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
