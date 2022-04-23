import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final CollectionReference _reviewss =
      FirebaseFirestore.instance.collection('reviews');
  // viewComments() {
  //   CollectionReference collectionReference =
  //       FirebaseFirestore.instance.collection('reviews');
  //
  //   collectionReference.snapshots().listen((snapshot) {
  //     List data;
  //     setState(() {
  //       data = snapshot.docs;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Color(0xff99879D),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Back",
          style: TextStyle(color: Color(0xff99879D)),
        ),
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: _reviewss.snapshots(),
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
                    title: Text(documentSnapshot['comment']),
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
      ),
      // Add new product
    );
  }

  // Widget buildComments() => Container(
  //       child: Padding(
  //         padding: const EdgeInsets.only(left: 16.0, top: 16.0),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: <Widget>[
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   'Kyle Wilson',
  //                   style: TextStyle(
  //                     fontSize: 20,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //                 SizedBox(height: 12),
  //                 Text(
  //                   'Awesome job!',
  //                   style: TextStyle(
  //                     color: Color(0xff99879D),
  //                     fontSize: 15,
  //                   ),
  //                 ),
  //                 SizedBox(height: 12),
  //                 Text('Rating'),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
}
