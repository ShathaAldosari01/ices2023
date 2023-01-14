import 'package:firebase_auth/firebase_auth.dart';
import 'package:ices2023/models/user.dart';
class AuthService{

  final FirebaseAuth _auth= FirebaseAuth.instance;

  //create obj based on firebaseUser
  Users? _userFromFirebaseUser(User? user){
    return user != null? Users(uid: user.uid) : null;
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
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
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