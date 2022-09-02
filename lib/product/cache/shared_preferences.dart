

import 'package:shared_preferences/shared_preferences.dart';

class SharedManager {
SharedManager._(){
  instanceShared();
}
SharedPreferences? prefs;
static SharedManager? _instance;

  static SharedManager  get instance  {
    _instance ??= SharedManager._();
    return _instance!;
  }
   Future<SharedPreferences>  instanceShared() async {
   if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
      return prefs!;
   }
   else {
    return prefs!;
   }
  }


  Future<void> saveBool(sharedKey key, bool value) async {
   final data =  await prefs?.setBool(sharedKey.isLightTheme.name, value);
  }

  bool readBool(sharedKey key)  {
    final bool? response =  prefs?.getBool(sharedKey.isLightTheme.name);
    return response ?? true;
  }
}

enum sharedKey {isLightTheme}