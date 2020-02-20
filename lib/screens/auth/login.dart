import 'package:fireapp/blocs/bloc.dart';
import 'package:fireapp/blocs/bloc_provider.dart';
import 'package:fireapp/screens/protected/secret_page.dart';
import 'package:flutter/material.dart';

import 'register.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //print("inside login");

    final bloc = BlocProvider.of(context);

    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(
          30.0,
          50.0,
          30.0,
          0.0,
        ),
        child: Column(
          children: <Widget>[
            _emailField(bloc),
            _passwordField(bloc),
            SizedBox(
              height: 20.0,
            ),
            _loginButton(bloc),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Dont have an account?  "),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                      ..pop()
                      ..push(
                        MaterialPageRoute(
                          builder: (context) => Register(),
                        ),
                      );
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _emailField(Bloc bloc) {
    return StreamBuilder(
      //every time a new value comes from the stream
      // the widget builds itself again
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.addEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            //border: OutlineInputBorder(),
            labelText: 'Enter email',
            hintText: 'jdoe@gmail',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget _passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.addPassword,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Enter Password',
            errorText: snapshot.error,
          ),
          // hintText: 'jdoe@gmail'
        );
      },
    );
  }

  Widget _loginButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.isFormValid,
      //initialData: false,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          child: RaisedButton(
            color: Colors.blue,
            onPressed: snapshot.hasData
                ? () async {
                    await bloc.loginUser();
                  }
                : null,
            child: Text("Login"),
          ),
        );
      },
    );
  }
}
