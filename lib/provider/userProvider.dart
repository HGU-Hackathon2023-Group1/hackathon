import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier{

  UserProvider(){
    init();
  }

  void init() async{

  }

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(User user) async{
    await users.doc(user.uid).set(<String, dynamic>{
      "userId" : user.uid,
      "name" : user.displayName,

    }).then((value){

    }).onError((error, stackTrace) => null);

  }

  Future<void> editUser(User user) async{
    await users.doc(user.uid).update({

    }).then((value){

    }).onError((error, stackTrace) => null);
  }

  Future<void> deleteUser(String uid) async{
    await users.doc(uid).delete();
  }

  Future<void> readUser(String uid) async {
    await users.doc(uid).get().then((value){
      if(!value.exists){
        print("userProvider: no data in the docId");
      }
      else{
        Map<String, dynamic> data = value.data() as Map<String, dynamic>;
        return Text("Name: ${data['name']}");
      }
    });
  }

}