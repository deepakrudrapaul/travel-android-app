import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wanderwagon/app.dart';
import 'package:wanderwagon/network/service_injector.dart';
import 'package:wanderwagon/ui/auth/login.dart';
import 'package:wanderwagon/ui/intro/intro.dart';



void main() async {

  ServiceInjector.configure(BuildType.PROD);
  Widget _defaultHome= new LoginPage();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool _seen = (sharedPreferences.getBool('seen') ?? false);
  if(!_seen){
    sharedPreferences.setBool('seen', true);
    _defaultHome = new IntroPage();
  }



  Route<dynamic> _getRoute(RouteSettings settings) {
    print(settings);
    if(settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => LoginPage(),
        fullscreenDialog: true
    );
  }


  runApp(
      WanderWagonApp(defaultHome: _defaultHome)
  );


}