import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wanderwagon/models/trip.dart';

class AddTripDialog extends StatefulWidget {
  @override
  AddTripDialogState createState() => new AddTripDialogState();
}

class AddTripDialogState extends State<AddTripDialog> {
  bool _canSave = false;
  Trip _newTrip = new Trip();

  FocusNode _focusNode = new FocusNode();

  final GlobalKey<AddTripDialogState> _formKey =
  GlobalKey<AddTripDialogState>();

  DateTime _date = new DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: new DateTime(2010),
        lastDate: new DateTime(2019));

    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
      });
    }
  }

  void _setCanSave(bool save) {
    if (save != _canSave) setState(() => _canSave = save);
  }

  List<String> _types = List<String>();
  String _type;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(onFocusChanged);

    _types.addAll(['Local', 'OutStation']);
    _type = _types.elementAt(0);
  }

  void onFocusChanged() {
    if(_focusNode.hasFocus) {
      _focusNode.unfocus();
      _selectDate(context);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  void _onTypeChanged(String value) {
    setState(() {
      _type = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Trip'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
          children: <Widget>[
            ListTile(
              title: TextFormField(
                decoration: InputDecoration(
                  labelText: "Name your Trip",
                ),
              ),
            ),
            ListTile(
              title: TextFormField(
                focusNode: _focusNode,
                decoration: InputDecoration(
                  labelText: "Starting Date",
                ),
              ),
            ),
            ListTile(
              title: TextField(
                decoration: InputDecoration(
                  labelText: "Source City",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Trip Type',
                ),
                child: new DropdownButtonHideUnderline(
                  child: new DropdownButton<String>(
                    value: _type,
                    isDense: true,
                    onChanged: (String newValue) {_onTypeChanged(newValue);},
                    items: _types.map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  onPressed: (){},
                  textColor: Colors.white,
                  child: Text('Start Trip'),
                ),

                RaisedButton(
                  onPressed: (){},
                  textColor: Colors.white,
                  child: Text('Save for Later'),
                )
              ],
            )

          ].toList(),
        ),
      ),
    );
  }
}