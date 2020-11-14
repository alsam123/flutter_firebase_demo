
import 'package:firebase_demo/models/Interns.dart';
import 'package:flutter/material.dart';

class InternsTile extends StatelessWidget {

  //final Intern interns;
  final Intern interns;
  InternsTile({ this.interns });
 
      
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          
          title: Text(interns.name),
          subtitle: Text(interns.department),
        ),
       /*  Row(children: [
            Text(interns.name),
        Text(interns.name),
        ],) */
       
      ),
    );
  }
}