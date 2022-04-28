import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workwaves/views/nav/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workwaves/views/nav/profile.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  List users = [];
  var data = '';

  final double coverHeight = 280;
  final double profileHeight = 144;

  late var name = '';
  late var email = '';
  late var phone = '';
  late var role = '';

  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _roleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      left: true,
      top: true,
      right: true,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Color(0xff99879D),
          ),
          backgroundColor: Colors.white,
          title: const Text(
            "Back",
            style: TextStyle(color: Color(0xff99879D)),
          ),
          elevation: 0,
        ),
        body: FutureBuilder(
            future: fetch(),
            builder: (context, snapshot) {
              return Padding(
                padding: EdgeInsets.all(15),
                child: Column(children: <Widget>[
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      labelText: 'Phone',
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _roleController,
                    decoration: InputDecoration(
                      labelText: 'Job',
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      final String? name = _nameController.text;
                      final String? email = _emailController.text;
                      final String? phone = _phoneController.text;
                      final String? role = _roleController.text;

                      final firebaseUser = FirebaseAuth.instance.currentUser;
                      final String? uid = firebaseUser?.uid.toString();

                      try {
                        DocumentReference post = await FirebaseFirestore
                            .instance
                            .collection('users')
                            .where('uid', isEqualTo: uid)
                            .get()
                            .then((QuerySnapshot snapshot) {
                          //Here we get the document reference and return to the post variable.
                          return snapshot.docs[0].reference;
                        });
                        print(name);
                        WriteBatch batch = FirebaseFirestore.instance.batch();
                        //Updates the field value, using post as document reference
                        batch.update(post, {
                          'fullName': name,
                          'email': email,
                          'phone': phone,
                          'role': role
                        });
                        batch.commit();
                      } catch (e) {
                        print(e);
                      }
                      Navigator.pop(context);
                    },
                    child: const Text('Update'),
                  ),
                ]),
              );
            }),
      ),
    );
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

      _nameController.text = name;
      _emailController.text = email;
      _phoneController.text = phone;
      _roleController.text = role;
    }
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
