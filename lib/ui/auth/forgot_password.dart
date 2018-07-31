import 'package:flutter/material.dart';
import 'package:wanderwagon/ui/auth/bloc/auth_provider.dart';
import 'package:wanderwagon/utils/country_code/country_code_picker.dart';


class ForgotPasswordPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final bloc = AuthProvider.of(context);
    ThemeData  theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
          child: Form(
            child: new ListView(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              children: <Widget>[
                const SizedBox(height: 80.0),
                Container(
                  child: Text('Forgot Password', textAlign: TextAlign.left, style: TextStyle(
                      fontSize: 32.0, fontWeight: FontWeight.bold
                  )),
                ),
                const SizedBox(height: 80.0),
                phoneField(bloc),
                const SizedBox(height: 16.0),
                otpField(bloc),
                const SizedBox(height: 16.0),
                passwordField(bloc),
                const SizedBox(height: 16.0),
                confirmPasswordField(bloc),
                const SizedBox(height: 32.0),
                submitButton(bloc),
                const SizedBox(height: 40.0),


              ],
            ),
          )
      ),
    );
  }


  Widget phoneField(bloc) {
    return StreamBuilder(
        stream: bloc.phone,
        builder: (context, snapshot) {
          return   TextField(
            onChanged: bloc.changePhone,
            keyboardType: TextInputType.phone, decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 16.0, top:16.0),
                child: CountryCodePicker(
                  onChanged: print,
                  initialSelection: '+91',
                  favorite: ['+91', 'IN'],
                ),
              ),
              filled: false,
              labelText: 'Phone Number',
              errorText: snapshot.error
          ),
          );
        }
    );
  }

  Widget otpField(bloc) {
    return StreamBuilder(
        stream: bloc.otp,
        builder: (context, snapshot) {
          return   TextField(
            onChanged: bloc.changeOtp,
            keyboardType: TextInputType.phone, decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 16.0, top: 8.0),
                child: Icon(Icons.vpn_key),
              ),
              filled: false,
              labelText: 'OTP',
              errorText: snapshot.error
          ),
          );
        }
    );
  }


  Widget passwordField(bloc) {
    return  StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changePassword,
            decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 16.0, top: 8.0),
                  child: Icon(Icons.lock_outline),
                ),
                filled: false,
                labelText: 'Password',
                errorText: snapshot.error
            ),
            obscureText: true,
          );
        }
    );
  }


  Widget confirmPasswordField(bloc) {
    return  StreamBuilder(
        stream: bloc.confirmPassword,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeConfirmPassword,
            decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 16.0, top: 8.0),
                  child: Icon(Icons.lock_outline),
                ),
                filled: false,
                labelText: 'Confirm Password',
                errorText: snapshot.error
            ),
            obscureText: true,
          );
        }
    );
  }


  Widget submitButton(bloc) {
    return StreamBuilder(
        stream: bloc.submitValid,
        builder: (context, snapshot) {
          return   RaisedButton(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
            textColor: Colors.white,
            child: Text('Submit'),
            onPressed: () {
              snapshot.hasData ? bloc.resetPassword() : null;
            },
          );
        }
    );
  }
}