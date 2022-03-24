import 'package:flutter/material.dart';

class WorkerListTile extends StatelessWidget {
   String head;
   IconData icon;

  WorkerListTile(this.head, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 37.0, top: 26.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.green,
            size: 25,
          ),
          SizedBox(width: 22),
          Text(
            head,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}