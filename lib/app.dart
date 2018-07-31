import 'package:flutter/material.dart';
import 'package:wanderwagon/ui/auth/bloc/auth_provider.dart';
import 'package:wanderwagon/ui/auth/forgot_password.dart';
import 'package:wanderwagon/ui/auth/login.dart';
import 'package:wanderwagon/ui/auth/sign_up.dart';
import 'package:wanderwagon/ui/feed/detail.dart';
import 'package:wanderwagon/ui/home.dart';
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
  );
}


class WanderWagonApp extends StatelessWidget {

  final Widget defaultHome;
  WanderWagonApp({this.defaultHome});


  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'WanderWagon',
          home: defaultHome,
          routes: <String, WidgetBuilder> {
            '/home': (BuildContext context) => HomePage(),
            '/login' : (BuildContext context) => LoginPage(),
            '/signup': (BuildContext context) => SignUpPage(),
            '/detail': (BuildContext context) => DetailPage(),
            '/forgotPassword': (BuildContext context) => ForgotPasswordPage()
          },
          theme: _kWanderTheme
      ),
    );
  }








}

