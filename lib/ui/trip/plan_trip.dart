import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlanTripPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    ThemeData  theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Plan Trip'),
      ),
      body: SafeArea(
          child:  ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Card(
                      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 60.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
                        child: TextFormField(
                          style: theme.textTheme.title,
                          initialValue: 'Delhi',
                          enabled: true,
                          decoration: InputDecoration(
                            border: InputBorder.none
                          ),
                        ),
                        width: double.infinity,
                        height: 50.0,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0.0,
                    bottom: 0.0,
                    left: 35.0,
                    child: new Container(
                      height: double.infinity,
                      width: 1.0,
                      color: Colors.blue,
                    ),
                  ),
                  new Positioned(
                    top: 80.0,
                    left: 15.0,
                    child: new Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: new Container(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        margin: new EdgeInsets.all(5.0),
                        height: 30.0,
                        width: 30.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            color: theme.primaryColor),
                      ),
                    ),
                  )
                ],
              );
            },
            itemCount: 5,
          )
      )
    );
  }


}
