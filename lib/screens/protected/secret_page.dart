import 'package:fireapp/blocs/bloc_provider.dart';
import 'package:flutter/material.dart';

class SecretPage extends StatefulWidget {
  @override
  _SecretPageState createState() => _SecretPageState();
}

class _SecretPageState extends State<SecretPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Secret Page"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text("Secret page"),
            SizedBox(
              height: 40.0,
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text("Logout"),
              onPressed: () async {
                //logout
                return await bloc.logout();
              },
            )
          ],
        ),
      ),
    );
  }
}
