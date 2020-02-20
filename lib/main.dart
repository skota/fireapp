import 'package:fireapp/blocs/bloc_provider.dart';
import 'package:fireapp/screens/wrapper.dart';
import 'package:fireapp/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'blocs/bloc_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
      value: AuthService().user,
      //BlocProvider - provides access to Bloc object
      child: BlocProvider(
        child: MaterialApp(
          title: 'Firebase Demo',
          theme: ThemeData(
            // This is the theme of your application.
            primarySwatch: Colors.blue,
          ),
          home: Wrapper(),
        ),
      ),
    );
  }
}
