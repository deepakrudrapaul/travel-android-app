import 'package:flutter/material.dart';
import 'package:wanderwagon/ui/auth/sign_up.dart';



class LoginPage extends StatefulWidget {

  @override
  LoginPageState createState() {
    return new LoginPageState();
  }
}


class LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SafeArea(
          child: Form(
            key: _formKey,
            child: new ListView(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              children: <Widget>[
                const SizedBox(height: 80.0),
                Container(
                  child: Text('Login', textAlign: TextAlign.left, style: TextStyle(
                    fontSize: 32.0, fontWeight: FontWeight.bold
                  )),
                ),
                const SizedBox(height: 80.0),
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
                        child: Icon(Icons.lock_outline),
                      ),
                    filled: false,
                    labelText: 'Password'
                  ),
                obscureText: true,
                ),
                const SizedBox(height: 5.0),
                Text('Forgot Password ?', textAlign: TextAlign.right, style: TextStyle(fontSize: 12.0),),
                const SizedBox(height: 20.0),
                RaisedButton(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    textColor: Colors.white,
                    child: Text('Login'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                const SizedBox(height: 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      color: Colors.black,
                      width: 80.0,
                      height: 1.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('OR CONNECT WITH', style: TextStyle(fontSize: 12.0),)),
                    Container(
                      color: Colors.black,
                      width: 80.0,
                      height: 1.0,
                    ),
                  ],
                ),
                const SizedBox(height: 40.0),
                RaisedButton(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  textColor: Colors.white,
                  child: Text('Google Sign In'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50.0),
                  child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                      },
                      child: Text('NOT A MEMBER YET ? SIGN UP ', textAlign: TextAlign.center,))

                ),

              ],
            ),
          )
      ),
    );
  }
}