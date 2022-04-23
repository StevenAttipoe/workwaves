import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:workwaves/views/nav/chat.dart';
import 'package:workwaves/views/nav/profile.dart';
import 'package:workwaves/views/nav/resume.dart';
import 'package:workwaves/views/nav/search.dart';
import 'package:firebase_core/firebase_core.dart';



class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();

  late Future resultsLoaded;
  List _allResults = [];
  List _resultsList=[];
  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = getSearchitem();
  }

  //function for search
  _onSearchChanged() {
    print(_searchController.text);
  }

  searchResultsList(){
    var showResults=[];
    if(_searchController.text!=""){
      //we have a search parameter
      for(var trip in _allResults){
        var
      }

    }else{
      showResults=List.from(_allResults);
    }
    setState(() {
      _resultsList=_allResults;
    });
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
    return "complete" *//*data.documents*//*;
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

            //filter icon
            Row(children: <Widget>[
              const Icon(
                Icons.filter_list,
                size: 40,
              )
            ]),

            Expanded(child: ListView.builder(
                itemCount: _resultsList.length,
                itemBuilder:( BuildContext context, int index)=>
                /*buildTripCard(context,_resultsList[index]),*/
            )
            /*
            Container(
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

            //name with Icons
            //Results from search will be here
          /*  SizedBox(height: 15),
            TextField(
*/
                /*"Create an Application",
              style: TextStyle(
                decorationColor: Colors.black,
                color: Colors.black,
                //color: Color(0xff100e0e),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),*/
               /* ),*/
         /*   SizedBox(height: 10),
            Text(
              "Description",
              style: TextStyle(
                color: Colors.black,
                //color: Color(0xff100e0e),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),*/
          /*  SizedBox(height: 10),*/
           /* Text(
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
            )*/
            ),
          ],
        ),
      ),
    ));
  }
}
