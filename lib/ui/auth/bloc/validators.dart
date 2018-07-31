import 'dart:async';

class Validators {

  static String oldPassword;

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
      oldPassword = password;
      sink.add(password);
    } else {
      sink.addError('Password must be atleast 8 characters');
    }
  });


  final validateConfirmPassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (confirmPassword, sink) {
        if(oldPassword == confirmPassword) {
        sink.add(confirmPassword);
      } else {
        sink.addError("Passwords doesn't match");
      }
  });
}
