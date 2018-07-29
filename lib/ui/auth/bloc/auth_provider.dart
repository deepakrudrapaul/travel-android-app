import 'package:flutter/widgets.dart';
import 'package:wanderwagon/ui/auth/bloc/auth_bloc.dart';

class AuthProvider extends InheritedWidget{

  final bloc = AuthBloc();

  AuthProvider({Key key, Widget child}):super(key : key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static AuthBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(AuthProvider) as AuthProvider).bloc;
  }

}