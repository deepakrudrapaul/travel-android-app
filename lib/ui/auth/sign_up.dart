import 'package:flutter/material.dart';



class SignUpPage extends StatefulWidget {

  @override
  SignUpPageState createState() => new SignUpPageState();
}


class SignUpPageState extends State<SignUpPage> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.dark,
        iconTheme: IconThemeData.fallback(),
        elevation: 0.0,
      ),
      body: SafeArea(
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              children: <Widget>[
                const SizedBox(height: 50.0),
                Container(
                  child: Text('New \nAccount', textAlign: TextAlign.left, style: TextStyle(
                      fontSize: 32.0, fontWeight: FontWeight.bold
                  )),
                ),
                const SizedBox(height: 50.0),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 16.0, top: 8.0),
                        child: Icon(Icons.person),
                      ),
                      filled: false,
                      labelText: 'Name'
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 16.0, top: 8.0),
                        child: Icon(Icons.phone),
                      ),
                      filled: false,
                      labelText: 'Phone Number'
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 16.0, top: 8.0),
                        child: Icon(Icons.lock),
                      ),
                      filled: false,
                      labelText: 'Password'
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 16.0, top: 8.0),
                        child: Icon(Icons.lock),
                      ),
                      filled: false,
                      labelText: 'Confirm Password'
                  ),
                  obscureText: true,
                ),

                const SizedBox(height: 50.0),
                RaisedButton(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  textColor: Colors.white,
                  child: Text('Sign Up'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),

              ],
            ),
          )
      ),
    );;
  }
}