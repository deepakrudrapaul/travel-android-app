import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:wanderwagon/models/auth/NewUser.dart';
import 'package:wanderwagon/models/auth/user.dart';
import 'package:wanderwagon/network/wanderwagon_service.dart';
import 'package:wanderwagon/ui/feed/feed.dart';
import 'package:http/http.dart' as http;

class WanderwagonServiceImpl implements WanderwagonService {

  static const apiUrl = 'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=7fbf37bdc1b44ffe83433e5d7d10b67b';

  @override
  Future<List<Feed>> fetchFeeds(http.Client client) async {
    final response = await client.get(apiUrl);
    return compute(parseFeeds, response.body);
  }

  @override
  Future<User> logIn(String phoneNumber, String password) {
    return null;
  }

  @override
  Future signUp(NewUser newUser) {
    return null;
  }
}

List<Feed> parseFeeds(String responseBody) {
  final parsed = json.decode(responseBody);
  return parsed['articles']
      .map<Feed>((json) => new Feed.fromJson(json))
      .toList();
}