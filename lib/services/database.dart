import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:ices2023/models/user.dart';

class DatabaseService{
  /*users*/
  final String uid;
  DatabaseService({required  this.uid});
  //1. collection reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection("users");

  //2. update user data
  Future updateUserData(String name,String specialty,String phoneNumber,String email,String linkedin) async{
    return await userCollection.doc(uid).set({
      'uid': uid,
      'name': name,
      'specialty': specialty,
      'phoneNumber': phoneNumber,
      'email': email,
      'linkedin': linkedin
    });
  }
  //3. get users

  //user list from snapshot
  List<Users> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      return Users(
        uid: doc.get("uid"),
        name: doc.get("name"),
        specialty: doc.get("specialty"),
        phoneNumber: doc.get("phoneNumber"),
        email: doc.get("email"),
        linkedin:  doc.get("linkedin"),
      );
    }).toList();
  }

  Stream<List<Users>> get users{
    return userCollection.snapshots().map(_userListFromSnapshot);
  }
  /*end of user*/

  /*agenda*/
  //1. collection reference
  final CollectionReference agendaCollection = FirebaseFirestore.instance.collection("agendas");

  //2. create agenda data
  Future createAgendaData(String title,String speaker,  String track, DateTime time, String location, int day) async{
    String agendaId =  const Uuid().v1();
    return await agendaCollection.doc(agendaId).set({
      'agendaId':agendaId,
      'title': title,
      'speaker': speaker,
      'track': track,
      'time': time,
      'location': location,
      'day': day
    });
  }

  //2. update agenda data
  Future updateAgendaData(String title,String speaker,  String agendaId, String track, DateTime time, String location, int day) async{
    return await agendaCollection.doc(agendaId).set({
      'agendaId':agendaId,
      'title': title,
      'speaker': speaker,
      'track': track,
      'time': time,
      'location': location,
      'day': day
    });
  }
}