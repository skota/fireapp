import 'dart:async';

class Validators {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      //emal is good
      sink.add(email);
    } else {
      //bad email
      sink.addError('Invalid email.');
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 5) {
      //emal is good
      sink.add(password);
    } else {
      //bad email
      sink.addError('Invalid password.');
    }
  });
}
