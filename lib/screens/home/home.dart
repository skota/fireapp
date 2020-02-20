import 'package:fireapp/blocs/bloc_provider.dart';
import 'package:fireapp/screens/home/add_todo.dart';
import 'package:fireapp/screens/home/todos/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todobloc = TodoBlocProvider.of(context);
    final bloc = BlocProvider.of(context);
    final todos = todobloc.getData();

    return StreamProvider<QuerySnapshot>.value(
      value: todos,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Todos"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () async {
                return await bloc.logout();
              },
            )
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: todos,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Text('Loading...');
              default:
                return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.check),
                      title: Text(snapshot.data.documents[index].data["title"]),
                      subtitle:
                          Text(snapshot.data.documents[index].data["desc"]),
                    );
                  },
                );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AddTodo(todobloc)));
          },
        ),
      ),
    );
  }
}
