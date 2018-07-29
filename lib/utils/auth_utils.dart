import 'package:shared_preferences/shared_preferences.dart';

class AuthUtils {

  static final String endPoint = '/api/v1/auth_user';

  // Keys to store and fetch data from SharedPreferences
  static final String authTokenKey = 'authToken';
  static final String userIdKey = 'userId';
  static final String nameKey = 'name';

  static String getToken(SharedPreferences sharedPrefs) {
    return sharedPrefs.get(authTokenKey);
  }

  static setAuthDetails(SharedPreferences sharedPrefs, var response) {
    sharedPrefs.setString(authTokenKey, response['authToken']);
    var user = response['user'];
    sharedPrefs.setInt(userIdKey, user['id']);
    sharedPrefs.setString(nameKey, user['name']);
  }

}