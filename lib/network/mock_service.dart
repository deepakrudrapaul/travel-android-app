import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:wanderwagon/models/auth/NewUser.dart';
import 'package:wanderwagon/models/auth/user.dart';
import 'package:wanderwagon/network/wanderwagon_service.dart';
import 'package:wanderwagon/ui/feed/feed.dart';
import 'package:http/http.dart' as http;

class MockService implements WanderwagonService {
  @override
  Future<List<Feed>> fetchFeeds(http.Client client) async{
    return compute(createFeeds, 20);
  }

  @override
  Future<User> logIn(String phoneNumber, String password) {
    if(phoneNumber == '9999999999' && password == 'password') {

    }
    return null;
  }

  @override
  Future signUp(NewUser newUser) {
    return null;
  }
}


List<Feed> createFeeds(int x) {
  List<Feed> feeds = List.generate(x, (i) => Feed(
      title: "Just a title $i",
      imageUrl: "https://placeimg.com/640/480/nature/$i"
  ));

  print('FEEDS :  $feeds');
  return feeds;
}