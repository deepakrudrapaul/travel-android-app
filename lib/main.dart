import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wanderwagon/network/service_injector.dart';
import 'package:wanderwagon/ui/auth/login.dart';
import 'package:wanderwagon/ui/auth/sign_up.dart';
import 'package:wanderwagon/ui/feed/detail.dart';
import 'package:wanderwagon/ui/home.dart';
import 'package:wanderwagon/ui/intro/intro.dart';
import 'package:wanderwagon/utils/colors.dart';


final ThemeData _kWanderTheme = _buildWanderTheme();

ThemeData _buildWanderTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      accentColor: kWanderRed700,
      primaryColor: kWanderPurple800,
      buttonColor: kWanderPurple800,
      scaffoldBackgroundColor: kWanderBackgroundWhite,
      cardColor: kWanderBackgroundWhite,
      textSelectionColor: kWanderRed700,
      errorColor: kWanderErrorRed
//    textTheme: _buildWanderTextTheme(base.textTheme),
//    primaryTextTheme: _buildWanderTextTheme(base.primaryTextTheme),
//    accentTextTheme: _buildWanderTextTheme(base.accentTextTheme),
//    primaryIconTheme: base.iconTheme.copyWith(
//      color: kWanderAltYellow
//    ),
  );
}

void main() async {

  Injector.configure(BuildType.PROD);
  Widget _defaultHome= new HomePage();
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
      MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'WanderWagon',
          home: _defaultHome,
          routes: <String, WidgetBuilder> {
            '/login' : (BuildContext context) => LoginPage(),
            '/signup': (BuildContext context) => new SignUpPage(),
            '/detail': (BuildContext context) => new DetailPage()
          },
          theme: _kWanderTheme
      )
  );


}