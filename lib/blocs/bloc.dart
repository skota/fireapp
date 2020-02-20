import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

import 'validators.dart';
import 'package:rxdart/rxdart.dart';
import '../services/auth_service.dart';

class Bloc with Validators {
  final AuthService _auth = AuthService();

  final BehaviorSubject<String> _emailCtrl = BehaviorSubject<String>();
  final BehaviorSubject<String> _passwordCtrl = BehaviorSubject<String>();

  //create getters to simplify access
  Function(String) get addEmail => _emailCtrl.sink.add;
  Function(String) get addPassword => _passwordCtrl.sink.add;

  Stream<String> get email => _emailCtrl.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordCtrl.stream.transform(validatePassword);

  Stream<bool> get isFormValid => Rx.combineLatest2(email, password, (e, p) {
        return true;
      });

  //submit method- get values from stream and save
  Future<FirebaseUser> registerUser() async {
    final String _goodEmail = _emailCtrl.value.trim();
    final String _goodPass = _passwordCtrl.value.trim();

    FirebaseUser result = await _auth.register(_goodEmail, _goodPass);

    return result;
  }

  Future<FirebaseUser> loginUser() async {
    final String _goodEmail = _emailCtrl.value.trim();
    final String _goodPass = _passwordCtrl.value.trim();

    //_auth.register(_goodEmail, _goodPass);
    FirebaseUser result = await _auth.login(_goodEmail, _goodPass);

    return result;
  }

  Future logout() async {
    return await _auth.logout();
  }

  // Stream<dynamic> get currentUser {
  //   return _auth.user;
  // }

  // bool isLoggedIn() {
  //   if (_auth.getCurrentUser() != null) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  dispose() {
    _emailCtrl.close();
    _passwordCtrl.close();
  }
}
