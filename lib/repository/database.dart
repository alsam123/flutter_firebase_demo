import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/models/Interns.dart';
import 'package:firebase_demo/models/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference internsCollection = Firestore.instance.collection('interns');

  Future<void> updateUserData(String name, String department) async {
    return await internsCollection.document(uid).setData({
      'name': name,
      'department': department,
    });
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      department: snapshot.data['department'],
    
    );
  }
  List<Intern>  fromJson(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      //print(doc.data);
      return Intern(
        name: doc.data['name'] ?? '',
        department: doc.data['department'] ?? 0,
  
      );
    }).toList();
  }


    Stream<List<Intern>> get interns {
    return internsCollection.snapshots()
      .map(fromJson);
  }

  Stream<UserData> get userData {
    return internsCollection.document(uid).snapshots()
      .map(_userDataFromSnapshot);
  }

}