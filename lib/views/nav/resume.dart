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
  late TooltipBehavior _tooltip;

  var _projects = FirebaseFirestore.instance;
  String uid = FirebaseAuth.instance.currentUser!.uid.toString();
  late List projectsData = [];
  late QuerySnapshot querySnapshot;

  List<ChartData> data = [];
  int total = 0;

  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
    getData();
    updateGraph();
    updateTotal();
  }

  void dispose() {
    super.dispose();
  }

  Future<void> getData() async {
    querySnapshot = await _projects
        .collection('project-info')
        .doc(uid)
        .collection('All-Projects')
        .get();

    setState(() {
      projectsData = querySnapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  void updateGraph() {
    List<ChartData> dataLoaded = [];
    for (var i = 0; i < projectsData.length; i++) {
      dataLoaded.add(ChartData('SEA' + i.toString(),
          double.parse(projectsData[i]['price'].toString())));
    }

    setState(() {
      data = dataLoaded;
    });
  }

  void updateTotal() {
    int x = 0;
    for (var i = 0; i < projectsData.length; i++) {
      x += int.parse(projectsData[i]['price'].toString());
    }

    setState(() {
      total = x;
    });
  }

  @override
  Widget build(BuildContext context) {
    updateGraph();
    updateTotal();

    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
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
              children: [
                const Text(
                  "Total Gains",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                ),
                Text(
                  "Ghc"+total.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                )
              ],
            )
          ],
        ),
        const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Text(
              "Active Project",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),
        SingleChildScrollView(
          child: Column(
            children: [
              (projectsData.isEmpty)
                  ? const Padding(
                      padding: EdgeInsets.only(top: 40.0),
                      child: Text("No gig in progress"),
                    )
                  : const Text(""),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: projectsData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(projectsData[index]['contact_name']),
                        ],
                      ),
                      subtitle: Text(projectsData[index]['project_name']),
                      trailing: IconButton(
                          onPressed: () {
                            showDeleteDialog(context, index);
                          },
                          icon: const Icon(Icons.delete)),
                    );
                  }),
            ],
          ),
        ),
      ]),
    )));
  }

  void showDeleteDialog(context, int index) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Gig'),
          content: const SingleChildScrollView(
            child: Text('Are you sure you want to delete this gig?'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Yes',
                style: TextStyle(color: Color(0xFFFFFFFF)),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              onPressed: () async {
                querySnapshot.docs[index].reference.delete();
                getData();
                updateGraph();
                updateTotal();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'No',
                style: TextStyle(color: Color(0xFFFFFFFF)),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
