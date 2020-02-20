import 'package:flutter/material.dart';
import 'todo_bloc.dart';

class TodoBlocProvider extends InheritedWidget {
  final todoBloc = TodoBloc();

  TodoBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) {
    return true;
  }

  static TodoBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<TodoBlocProvider>(
            aspect: TodoBlocProvider))
        .todoBloc;
  }
}
