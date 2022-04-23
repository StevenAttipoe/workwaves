import 'package:flutter/material.dart';

class ActiveProjects extends StatefulWidget {
  const ActiveProjects({ Key? key }) : super(key: key);

  @override
  State<ActiveProjects> createState() => _ActiveProjectsState();
}

class _ActiveProjectsState extends State<ActiveProjects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xff99879D),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Back",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 5),
            SingleChildScrollView(
              child: Column( 
                children:   [
                  const Align(
                    alignment:Alignment(-0.9,-1),
                    child: Text(
                      "DETAILS",
                      style: TextStyle(
                              fontSize: 22
                            )
                    ),
                  ),
                    Container(
                      height: 70,
                       decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.black12),
                          bottom: BorderSide(color: Colors.black12),                          ),
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: ListTile(
                          title: Text(
                            'Total Gains',
                             style: TextStyle(
                              fontSize: 30
                            )),
                          trailing:  Text(
                            '20',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30
                            ),),
                        ),
                      ),
                    ),
                     Container(
                      height: 70,
                       decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.black12),
                          bottom: BorderSide(color: Colors.black12),                          ),
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: ListTile(
                          title: Text(
                            'Total Projects',
                             style: TextStyle(
                              fontSize: 30
                            )
                            ),
                          trailing:  Text(
                            '120',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30
                            ),),
                        ),
                      ),
                    ),
                    Container(
                      height: 70,
                       decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.black12),
                          bottom: BorderSide(color: Colors.black12),                          ),
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: ListTile(
                          title: Text(
                            'Total Request',
                             style: TextStyle(
                              fontSize: 30
                            )
                            ),
                          trailing:  Text(
                            '80',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30
                            ),),
                        ),
                      ),
                    ),
                    
                     Container(
                      height: 70,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.black12),
                          bottom: BorderSide(color: Colors.black12),                          ),
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: ListTile(
                          title: Text(
                            'Total Reviews',
                             style: TextStyle(
                              fontSize: 30
                            )
                            ),
                          trailing:  Text(
                            '64',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30
                            ),),
                        ),
                      ),
                    ),
                    
                ],
              ),
            ),
          ],
        )
      ),
      
    );
  }
}