import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workwaves/views/loginScreen.dart';
import 'package:workwaves/views/subpages/review_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List users = [];
  var data = '';

  final double coverHeight = 280;
  final double profileHeight = 144;

  late var name = '';
  late var email = '';
  late var phone = '';
  late var role = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(padding: EdgeInsets.zero, children: <Widget>[
        buildTop(),
        buildContent(),
        SizedBox(height: 20),
        buildReviews(),
        SizedBox(height: 115),
        buildSignOut(),
      ]),
    );
  }

  Widget buildTop() {
    final top = coverHeight - profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        buildCoverImage(),
        Positioned(
          top: top,
          child: buildProfileImage(),
        ),
      ],
    );
  }

  Widget buildContent() {
    return Container(
        child: FutureBuilder(
      future: fetch(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done)
          return Text("Loading data ... Please wait");
        return Column(
          children: <Widget>[
            SizedBox(height: 60),
            Text(
              name,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 5),
            Text(
              role,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff99879D),
              ),
            ),
            SizedBox(height: 15),
            Align(
              child: Padding(
                padding: EdgeInsets.only(left: 16),
                child: Column(
                  children: [
                    Text(
                      email,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      phone,
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff99879D),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    ));
  }

  Future<void> fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    final String? uid = firebaseUser?.uid.toString();

    if (firebaseUser != null) {
      var document = await FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: uid)
          .get();

      users = document.docs.map((doc) => doc.data()).toList();
      data = users[0]['role'];

      name = users[0]['fullName'];
      email = users[0]['email'];
      phone = users[0]['phone'];
      role = users[0]['role'];

      // document.get().then((ds) {
      //   name = ds.data.docs[index].data()!["fullName"];
      //   role = ds.data()!["role"];
      //   email = ds.data()!["email"];
      //   phone = ds.data()!["phone"];
      // }
      // UserQuery.get().then(
      //   (ds) {
      //     name = ds.['fullName'];
      //     email = ds.data['email'];
      //     role = ds.metadata['role'];
      //     phone = ds['phone'];
      //   },
      // ).catchError((e) {
      //   print(e);
      // })
    }
  }

Widget buildReviews() => Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text('4 Reviews'),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ReviewScreen()));
                },
                child: const Text('View All'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                )),
          ],
        ),
      );

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.network(
          "https://images.unsplash.com/photo-1533090161767-e6ffed986c88?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80",
          height: coverHeight,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      );

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2.5,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: NetworkImage(
          "https://cdn-icons-png.flaticon.com/512/1077/1077012.png",
        ),
      );

  Widget buildSignOut() => Align(
        alignment: Alignment.bottomRight,
        child: ElevatedButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          child: const Text('Sign Out'),
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
          ),
        ),
      );
}

