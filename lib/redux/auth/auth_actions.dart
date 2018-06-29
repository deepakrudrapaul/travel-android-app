import 'package:flutter/foundation.dart';
import 'package:wanderwagon/models/auth/user.dart';



class LogIn {}

class LogInSuccessful  {
  final User user;

  LogInSuccessful({
    @required this.user
  });

  @override
  String toString() {
    return 'LogIn User: $user';
  }
}


class LogInFail {
  final dynamic error;

  LogInFail(this.error);

  @override
  String toString() {
    return 'LogIn {There was an error logged in : $error}';
  }
}

class LogOut {}