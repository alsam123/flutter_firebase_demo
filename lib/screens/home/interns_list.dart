import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/models/Interns.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'intern_tile.dart';

class InternsList extends StatefulWidget {
  @override
  _InternsListState createState() => _InternsListState();
}

class _InternsListState extends State<InternsList> {
  @override
  Widget build(BuildContext context) {
    int i=0;
    final interns = Provider.of<List<Intern>>(context) ?? [];
    List k;
    
    /*  interns.forEach((intern) {
      if(intern.name == " "){
        interns.remove(intern);
      }
      //print(intern.name);
      //print(intern.department);
      
    }); */
   
    

    return ListView.builder(
      itemCount: interns.length,
      itemBuilder: (context, index) {
        return InternsTile(interns: interns[index]);
       
      },
    );
  }
}