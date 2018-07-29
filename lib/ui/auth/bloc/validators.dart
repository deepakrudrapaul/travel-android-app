import 'dart:async';

class Validators {
  final validatePhone =
      StreamTransformer<String, String>.fromHandlers(handleData: (phone, sink) {
    if (phone.length == 10) {
      sink.add(phone);
    } else {
      sink.addError('Enter a valid Phone Number');
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 8) {
      sink.add(password);
    } else {
      sink.addError('Password must be atleast 8 characters');
    }
  });
}
