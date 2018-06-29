import 'package:redux/redux.dart';
import 'package:wanderwagon/models/auth/user.dart';
import 'package:wanderwagon/redux/auth/auth_actions.dart';

final authReducer = combineReducers<User>([
  TypedReducer<User, LogInSuccessful>(_logIn),
  TypedReducer<User, LogOut>(_logOut)
]);


User _logIn(User user, action) {
  return action.user;
}

Null _logOut(User user, action) {
  return null;
}