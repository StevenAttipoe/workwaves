import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:workwaves/model/project_model.dart';
import 'package:workwaves/views/subpages/projects.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:workwaves/model/chart_data.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({Key? key}) : super(key: key);

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  late List<ChartData> data;
  late TooltipBehavior _tooltip;
  final CollectionReference _projects =
      FirebaseFirestore.instance.collection('project-info');
  var collection = FirebaseFirestore.instance.collection('project-info');

  @override
  void initState() {
    data = [
      ChartData('CHN', 12),
      ChartData('GER', 15),
      ChartData('RUS', 30),
      ChartData('BRZ', 6.4),
      ChartData('IND', 14)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      const Padding(
        padding: EdgeInsets.only(left: 10, top: 10),
        child: Text(
          "Resume",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SizedBox(
                width: MediaQuery.of(context).size.width * .50,
                child: SfCartesianChart(
                    plotAreaBorderWidth: 0,
                    primaryXAxis: CategoryAxis(
                        majorGridLines: const MajorGridLines(width: 0),
                        axisLine: const AxisLine(width: 0),
                        isVisible: false),
                    primaryYAxis: NumericAxis(
                        minimum: 0,
                        maximum: 40,
                        interval: 10,
                        majorGridLines: const MajorGridLines(width: 0),
                        axisLine: const AxisLine(width: 0),
                        isVisible: false),
                    tooltipBehavior: _tooltip,
                    series: <ColumnSeries<ChartData, String>>[
                      ColumnSeries<ChartData, String>(
                          dataSource: data,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          color: Colors.orange)
                    ])),
          ),
          Column(
            children: const [
              Text(
                "Total Gains",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
              ),
              Text(
                "20K",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              )
            ],
          )
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Active Projects",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF000000))),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ActiveProjects()));
                },
                child: const Text(
                  "View All",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
      SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: collection.doc('5jCxXY2bQGuOIqVGIy9n').snapshots(),
              builder: (_, snapshot) {
                if (snapshot.hasError) return Text('Error = ${snapshot.error}');

                if (snapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.data()!.length,
                    itemBuilder: (context, index) {
                      final Map<String, dynamic>? documentSnapshot =
                          snapshot.data!.data();
                      print(documentSnapshot);
                      return ListTile(
                        title: Text(documentSnapshot!['contact_name']),
                        subtitle: Text(documentSnapshot['project_name']),
                        trailing: Text(documentSnapshot['status']),
                      );
                    },
                  );
                }

                return const Center(child: CircularProgressIndicator());
              },
            )
            //       StreamBuilder(
            //           stream:  _projects.snapshots(),
            //           builder: (context,AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            //             if (streamSnapshot.hasData) {
            //               return ListView.builder(
            //                 scrollDirection: Axis.vertical,
            //                 shrinkWrap: true,
            //                 itemCount: streamSnapshot.data!.docs.length,
            //                 itemBuilder: (context, index) {
            //                   final DocumentSnapshot documentSnapshot =
            //                       streamSnapshot.data!.docs[index];
            //                   return ListTile(
            //                       title: Text(documentSnapshot['contact_name']),
            //                       subtitle:Text(documentSnapshot['project_name']),
            //                       trailing: Text(documentSnapshot['status']),

            //                   );
            //                 },
            //               );
            //             }
            //             return const Center(
            //               child: CircularProgressIndicator(),
            //             );
            //           }),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    ])));
  }
}
