import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Feed {

  String author;
  String title;
  String description;
  String imageUrl;

  Feed({this.author, this.title, this.description, this.imageUrl});

  factory Feed.fromJson(Map<String, dynamic> json) {
    return new Feed(
      author: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['urlToImage'] as String
    );
  }
  
}

Future<List<Feed>> fetchFeeds() async {
  final response = await http.get(
      'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=7fbf37bdc1b44ffe83433e5d7d10b67b');
  return compute(parseFeeds, response.body);
}

List<Feed> parseFeeds(String responseBody) {
  final parsed = json.decode(responseBody);
  return parsed['articles']
      .map<Feed>((json) => new Feed.fromJson(json))
      .toList();
}

class FeedPage extends StatefulWidget {

  FeedPage({Key key}) : super(key: key);

  @override
  FeedState createState() => new FeedState();

}


class FeedState extends State<FeedPage> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Feed>>(
      future: fetchFeeds(),
      builder: (context, snapshot) {
        if(snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ?  FeedListView(feeds: snapshot.data) : Center(child: CircularProgressIndicator());
      },
    );
  }
}


class FeedListView extends StatelessWidget {

  final List<Feed> feeds;

  FeedListView({this.feeds});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: feeds.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/detail');
            },
            child:  Card(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                elevation: 2.0,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(feeds[index].title,
                            style: new TextStyle(
                                color: Colors.grey[800], fontSize: 18.0))),
                    new Image.network(feeds[index].imageUrl),
                    new Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(feeds[index].description,
                            style: new TextStyle(
                                color: Colors.grey[800], fontSize: 14.0)))
                  ],
                ))
        );
      },
    );
  }

}

