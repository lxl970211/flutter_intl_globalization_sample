
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class Global{


  static late SharedPreferences _prefs;

  static String? locale;

  static Future init() async{

    WidgetsFlutterBinding.ensureInitialized();
    _prefs = await SharedPreferences.getInstance();

    locale = _prefs.getString("locale");



  }

  static saveLocale(){
    if (locale != null) {
      _prefs.setString('locale', locale!);
    }
  }

}