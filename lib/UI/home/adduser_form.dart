
import 'package:firebase_demo/models/user.dart';
import 'package:firebase_demo/repository/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddRecordForm extends StatefulWidget {
  @override
  _AddRecordFormState createState() => _AddRecordFormState();
}

class _AddRecordFormState extends State< AddRecordForm> {

  final _formKey = GlobalKey<FormState>();
 

  // form values
  String _currentName;
  String _currentDepartment;
  

  @override
  Widget build(BuildContext context) {
   final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid:user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData){
           UserData userdata = snapshot.data;
           return Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text(
                'Add or update your record',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                     hintText: 'Enter your name'
                   ),
                validator: (val) => val.isEmpty ? 'Please enter a name' : null,
                onChanged: (val) => setState(() => _currentName = val),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
                     hintText: 'Department'
                   ),
                validator: (val) => val.isEmpty ? 'Please enter a valid value' : null,
                onChanged: (val) => setState(() => _currentDepartment = val),
              ),
              SizedBox(height: 10.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                    if(_formKey.currentState.validate()){
                      await DatabaseService(uid: user.uid).updateUserData(
                       
                        _currentName ?? snapshot.data.name, 
                        _currentDepartment ?? snapshot.data.department
                      );
                      Navigator.pop(context);
                    }
                  }
              ),
            ],
          ),
        );
        }
        else{

        }
        
      }
    );
  }
}