import 'package:flutter/material.dart';
import 'package:wanderwagon/ui/auth/bloc/auth_provider.dart';
import 'package:wanderwagon/ui/auth/forgot_password.dart';
import 'package:wanderwagon/ui/auth/sign_up.dart';
import 'package:wanderwagon/utils/country_code/country_code_picker.dart';


class LoginPage extends StatelessWidget {


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
                  child: Text('Login', textAlign: TextAlign.left, style: TextStyle(
                    fontSize: 32.0, fontWeight: FontWeight.bold
                  )),
                ),
                const SizedBox(height: 80.0),
                phoneField(bloc),
                const SizedBox(height: 16.0),
                passwordField(bloc),
                const SizedBox(height: 20.0),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPasswordPage(), fullscreenDialog: true)
                    );
                  },
                    child: Text('Forgot Password ?', textAlign: TextAlign.right, style: TextStyle(fontSize: 12.0),)),
                const SizedBox(height: 20.0),
                submitButton(bloc),
                const SizedBox(height: 40.0),

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


  Widget submitButton(bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return   RaisedButton(
          padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          textColor: Colors.white,
          child: Text('Login'),
          onPressed: () {
            snapshot.hasData ? bloc.submit() : null;
          },
        );
      }
    );
  }
}