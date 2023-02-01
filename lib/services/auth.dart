import 'package:firebase_auth/firebase_auth.dart';
import 'package:ices2023/models/user.dart';
import 'package:ices2023/services/database.dart';
class AuthService{

  final FirebaseAuth _auth= FirebaseAuth.instance;

  //create obj based on firebaseUser
  Users? _userFromFirebaseUser(User? user){
    return user != null? Users(uid: user.uid, name: "", email: "", linkedin: "", specialty: "", phoneNumber: "" ) : null;
  }

  //auth change user stream
  Stream<Users?> get user{
    return _auth.authStateChanges()
    //.map((User? user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }


  //sign up anon
  Future signInAnon() async{
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //login with email & pass
  Future logInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(String name, String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      //creating a new doc in db for the user
      await DatabaseService(uid: user!.uid).updateUserData(name, "", "", email, "");
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }


}