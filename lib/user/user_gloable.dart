import 'package:shared_preferences/shared_preferences.dart';

class UserGloable {
  static final UserGloable _profile = UserGloable._();
  UserGloable._();
  static UserGloable get profile => _profile;

  static Future<SharedPreferences> get prefs async {
    final SharedPreferences p = await SharedPreferences.getInstance();
    return p;
  }

  static Future<String> get lastLogin async {
    return "";
  }
}
