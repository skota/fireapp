import 'package:fireapp/screens/auth/login.dart';
import 'package:fireapp/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home/todos/todo_provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    //get "user" from StreamProvider<FirebaseUser>.value
    final FirebaseUser user = Provider.of<FirebaseUser>(context);

    if (user != null) {
      //wrap home in todo_provider
      return TodoBlocProvider(
        child: Home(),
      );
    } else {
      return Login();
    }
  }
}
