import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnTripPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('On Trip'),
      ),
      body: SafeArea(child: Text(' On Trip Page')),
    );
  }


}
