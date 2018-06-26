import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wanderwagon/data/models/trip.dart';
import 'package:quick_actions/quick_actions.dart';

class TripsPage extends StatefulWidget {
  TripsPage({Key key}) : super(key: key);

  @override
  TripsState createState() => new TripsState();
}

class TripsState extends State<TripsPage> {

  @override
  void initState() {
    super.initState();
    final QuickActions quickActions = const QuickActions();
    quickActions.initialize((String shortcutType) {
      if (shortcutType == 'action_add_trip') {
        _openAddTripDialog();
      }
    });

    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
          type: 'action_add_trip', localizedTitle: 'Add Trip', icon: 'add_circle'),
    ]);
  }
  List<Trip> trips = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: trips.length == 0 ? Center(child: Text('No Trips')) :
      ListView.builder(
        itemCount: trips.length,
        itemBuilder: (context, index) {
          final trip = trips[index];

          return Card(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              elevation: 2.0,
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Image.asset('assets/logo-short.png', height: 50.0, width: 50.0),
                        title: Text(trip.tripName),
                        subtitle: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Text(trip.departureCity)
                            ),

                            Icon(Icons.arrow_forward, size: 10.0),
                            Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(trip.destinationCity)
                            ),
                          ],
                        ),
                      ),
                    )
                  ]));
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), onPressed: () => _openAddTripDialog()),
    );
  }

  Future _openAddTripDialog() async {
    Trip trip = await Navigator.of(context).push(new MaterialPageRoute<Trip>(
        builder: (BuildContext context) {
          return AddTripDialog();
        },
        fullscreenDialog: true));

    setState(() {
      if(trip != null) {
        trips.add(trip);
      }
    });
  }
}

class AddTripDialog extends StatefulWidget {
  @override
  AddTripDialogState createState() => new AddTripDialogState();
}

class AddTripDialogState extends State<AddTripDialog> {
  bool _canSave = false;
  Trip _newTrip = new Trip();

  final GlobalKey<AddTripDialogState> _formKey = GlobalKey<AddTripDialogState>();
  DateTime _date = new DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(2013),
        lastDate: new DateTime(2019)
    );
  }

  void _setCanSave(bool save) {
    if (save != _canSave) setState(() => _canSave = save);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Trip'),
        actions: <Widget>[
          FlatButton(
              child: Text('ADD',
                  style: theme.textTheme.body1.copyWith(
                      color: _canSave
                          ? Colors.white
                          : Color.fromRGBO(255, 255, 255, 0.5))),
              onPressed: _canSave
                  ? () {
                      Navigator.of(context).pop(_newTrip);
                    }
                  : null)
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
          children: <Widget>[
            ListTile(
              title: TextField(
                decoration: InputDecoration(
                  hintText: "Name your Trip",
                ),
                onChanged: (String value) {
                  _newTrip.tripName = value;
                  _setCanSave(value.isNotEmpty);
                },
              ),
            ),
            ListTile(
              title: TextField(
                decoration: InputDecoration(
                  hintText: "Start Date",
                ),
              ),
            ),
            ListTile(
              title: TextField(
                decoration: InputDecoration(
                  hintText: "End Date",
                ),
              ),
            ),
            const Divider(
              height: 1.0,
            ),
            ListTile(
              title: TextField(
                decoration: InputDecoration(
                  hintText: "Departure City",
                ),
                onChanged: (String value) {
                  _newTrip.departureCity = value;
                  _setCanSave(value.isNotEmpty);
                },
              ),
            ),
            new ListTile(
              title: new TextField(
                decoration: new InputDecoration(
                  hintText: "Destination City",
                ),
                onChanged: (String value) {
                  _newTrip.destinationCity = value;
                  _setCanSave(value.isNotEmpty);
                },
              ),
            ),
          ].toList(),
        ),
      ),
    );
  }
}
