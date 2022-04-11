import 'package:flutter/material.dart';
import 'package:workwaves/subpages/projects.dart';

class ResumePage extends StatelessWidget {
  const ResumePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
            child: Column(
              children:  [
                 const Padding(
                   padding: EdgeInsets.only(left:10,top: 10),
                   child: Text(
                     "Resume",
                     style: TextStyle(
                       fontSize: 30,
                       fontWeight: FontWeight.bold
                     ),
                     ),
                 ),
                 Row(children:  [
                   SizedBox(
                     width: MediaQuery.of(context).size.width * .50,
                     child: 
                      Container(
                        height: MediaQuery.of(context).size.height * .40,
                        color: Colors.grey,
                      ),),
                   Column(
                     children: const [
                        Text(
                         "Total Gains",
                         style: TextStyle(
                           fontSize: 25,
                           fontWeight: FontWeight.bold,
                           color: Colors.orange
                         ),),
                         SizedBox(height: 50),
                        Text(
                          "20K",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50

                          ),)
                     ],
                   )
                 ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  const Text(
                    "Active Projects",
                    style: TextStyle(
                      fontSize:25,
                      fontWeight: FontWeight.bold
                    ),),
                  ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFF000000)) ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) => ActiveProjects()));
                    },
                  child: const Text(
                    "View All",
                    style: TextStyle(
                      color: Colors.white
                    ),))
                ],)
              ],
            ),
          ),
    );
  }
}