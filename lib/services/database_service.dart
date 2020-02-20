import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // final String uid;

  // DatabaseService({this.uid});
  DatabaseService();

  //get reference to collection
  final CollectionReference todoCollection =
      Firestore.instance.collection('todos');

  //add a new todo
  Future addTodo(String title, String desc) async {
    return await todoCollection
        .document()
        .setData({'title': title, 'desc': desc});
  }

  Stream<QuerySnapshot> get todos {
    return todoCollection.snapshots();
  }

  // Firestore.instance
  //   .collection('talks')
  //   .where("topic", isEqualTo: "flutter")
  //   .snapshots()
  //   .listen((data) =>
  //       data.documents.forEach((doc) => print(doc["title"])));
}
