import 'package:flutter/material.dart';
import 'bloc.dart';

// class BlocProvider extends InheritedWidget {
class BlocProvider extends InheritedWidget {
  final bloc = Bloc();

  BlocProvider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static Bloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<BlocProvider>(
            aspect: BlocProvider))
        .bloc;
  }
}
