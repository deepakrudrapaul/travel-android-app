import 'package:flutter/material.dart';
import 'package:wanderwagon/ui/feed/feed.dart';
import 'package:wanderwagon/ui/trip/trip.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final Key tripPageKey = PageStorageKey('trip');
  final Key feedPageKey = PageStorageKey('feed');
  final Key communityPageKey = PageStorageKey('community');


  final PageStorageBucket bucket = PageStorageBucket();

  int currentTab = 0;

  TripsPage tripsPage;
  FeedPage feedPage;

  List <Widget> pages;
  Widget currentPage;

  @override
  initState() {
    tripsPage = TripsPage(key: tripPageKey);
    feedPage = FeedPage(key: feedPageKey);
    pages = [tripsPage, feedPage];
    currentPage = tripsPage;


    super.initState();
  }


  void _showModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            color: Colors.transparent,
            child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(16.0),
                        topRight: const Radius.circular(16.0))),
                child: new Center(
                  child: new Text("Menu"),
                )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Wander Wagon'),
      ),
      body: PageStorage(
          bucket: bucket,
          child: currentPage
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (int index) {
          setState(() {
            if(index == 2) {
              _showModalSheet();
            } else {
              currentTab = index;
              currentPage = pages[index];
            }
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.card_travel),
              title: Text("Trip"),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.rss_feed), title: new Text("Feed")),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu), title: new Text("Menu")),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
