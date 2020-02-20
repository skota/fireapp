import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireapp/services/database_service.dart';

class TodoBloc {
  //get reference to db service
  final DatabaseService _db = DatabaseService();

  //insert todo
  Future addTodo(String title, String desc) {
    return _db.addTodo(title, desc);
  }

  //get todos
  Stream<QuerySnapshot> getData() {
    return _db.todos;
  }

  //edit todo
  //delete todo

}
