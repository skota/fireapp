import 'package:firebase_auth/firebase_auth.dart';
import 'database_service.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<FirebaseUser> get user {
    return _auth.onAuthStateChanged.map((FirebaseUser user) {
      //current user when signed in, null when signed out
      return user;
    });
  }

  // sign up - returns user or error
  Future<dynamic> register(String email, String password) async {
    // print("adding email:$email and password: $password ");
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;

      //create a new collection to hold all users documet
      await DatabaseService().addTodo("walk the dog", "walk the dog");

      return user;
    } catch (e) {
      //uhoh exception
      print(e.toString());
      return null;
    }
  }

  // login
  Future<dynamic> login(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());

      //return result with error message
      return null;
    }
  }

  // sign out
  Future logout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print("Error signing out...");
      print(e.toString());
      return null;
    }
  }

  //current user
  Future<FirebaseUser> getCurrentUser() async {
    return await _auth.currentUser();
  }
}
