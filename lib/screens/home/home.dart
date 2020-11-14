import 'package:firebase_demo/models/Interns.dart';
import 'package:firebase_demo/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_demo/services/database.dart';

import 'package:provider/provider.dart';
import 'package:firebase_demo/screens/home/interns_list.dart';

import 'adduser_form.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
     void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child:AddRecordForm(),
        );
      });
    }
    return /*  StreamProvider<List<Intern>>.value(
      value: DatabaseService().interns,
          child: Container(
        child: */  Scaffold(
          backgroundColor: Colors.brown[50],
          
          appBar: AppBar(
            //title: Text('My Homepage'),
            backgroundColor: Colors.brown[400],
            elevation: 0.0,
            
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),Spacer(),
              FlatButton.icon(
              icon: Icon(Icons.add),
              label: Text('Add or update record'),
              onPressed: () => _showSettingsPanel(),
            )
            ],
          ),
          body:
          //InternsList(),
          Center(child:FlatButton(color: Colors.brown[400],child:Text("View records of registered interns"),onPressed: (){ Navigator.push( 
              context, 
              MaterialPageRoute(builder:  
                (context) => SecondRoute()), 
              ); },) )
      //  ),
     // ),
    );
    
  }
}
class SecondRoute extends StatelessWidget { 
  @override 
  Widget build(BuildContext context) { 
    return  StreamProvider<List<Intern>>.value(
      value: DatabaseService().interns,
          child: Container(
        child:Scaffold( 
      
      body: Center( 
        child:InternsList()
      ),)) 
    ); 
  } 
}