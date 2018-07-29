import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:wanderwagon/network/service_injector.dart';

class Feed {

  String title;
  String imageUrl;

  Feed({this.title, this.imageUrl});

  factory Feed.fromJson(Map<String, dynamic> json) {
    return new Feed(
      title: json['title'] as String,
      imageUrl: json['urlToImage'] as String
    );
  }
  
}


class FeedPage extends StatefulWidget {

  FeedPage({Key key}) : super(key: key);

  @override
  FeedState createState() => new FeedState();

}


class FeedState extends State<FeedPage> {

  ServiceInjector injector;


  @override
  void initState() {
    super.initState();
    injector = ServiceInjector();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Feed>>(
      future: injector.wanderwagonService.fetchFeeds(http.Client()),
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
                  ],
                ))
        );
      },
    );
  }

}

