import 'package:fireapp/screens/home/todos/todo_bloc.dart';
import 'package:fireapp/screens/wrapper.dart';
import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {
  final TodoBloc bloc;

  AddTodo(this.bloc);

  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleCtrl.text = "Walk the dog";
    descCtrl.text = "Take the dog to the park";

    return Scaffold(
      appBar: AppBar(
        title: Text("New Todo"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(
          30.0,
          50.0,
          30.0,
          0.0,
        ),
        child: Column(
          children: <Widget>[
            _titleField(),
            _descField(),
            SizedBox(
              height: 20.0,
            ),
            _loginButton(context, widget.bloc),
          ],
        ),
      ),
    );
  }

  Widget _titleField() {
    return TextField(
      onChanged: (val) => titleCtrl.text = val.trim(),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Todo',
        hintText: 'Walk the dog',
        //errorText: (titleCtrl.text.length > 5) ? null : 'Please add a title',
      ),
    );
  }

  Widget _descField() {
    return TextField(
      onChanged: (val) => descCtrl.text = val.trim(),
      decoration: InputDecoration(
        labelText: 'Enter Description',
        hintText: "Take the dog to the park....",
        //errorText:
        //     (descCtrl.text.length > 5) ? null : 'Please add a description',
      ),
    );
  }

  Widget _loginButton(BuildContext context, TodoBloc todoBloc) {
    return RaisedButton(
      child: Text("Create Todo"),
      onPressed: () async {
        await todoBloc.addTodo(titleCtrl.text, descCtrl.text);

        Navigator.of(context)
          ..pop()
          ..push(
            MaterialPageRoute(
              builder: (context) => Wrapper(),
            ),
          );
      },
    );
  }
}
