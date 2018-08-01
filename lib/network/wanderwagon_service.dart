import 'dart:async';
import 'package:wanderwagon/models/auth/NewUser.dart';
import 'package:wanderwagon/models/auth/user.dart';
import 'package:wanderwagon/ui/feed/feed.dart';
import 'package:http/http.dart' as http;


abstract class WanderwagonService {

  Future<List<Feed>> fetchFeeds(http.Client client);

  Future<dynamic> signUp(NewUser newUser);

  Future<User> logIn(String phoneNumber, String password);

}