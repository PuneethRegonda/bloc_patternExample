import 'dart:async';

class Validator {
  final validatorEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError('Enter the data');
    }
  });

  final validatorPass = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 5) {
      sink.add(password);
    } else {
      sink.addError('entre the password greater than 5 ');
    }
  });

  String emailValidator(String value) {
    String str = '';
    if (!value.contains('@')) {
      str = 'Enater valid Email';
    }
    return str;
  }

  String passwordValidatro(String value) {
    String errtext = '';
    if (value.length < 4) {
      errtext = 'Password is too small';
    }
    return errtext;
  }
}
