import 'package:flutter/material.dart';
import 'package:globalization_sample/common/Global.dart';

class LocalModel extends ChangeNotifier {


  Locale? getLocal() {
    if (Global.locale == null) return null;

    var t = Global.locale!.split("_");
    return Locale(t[0], t[1]);
  }

  String? get local => Global.locale;

  set local(String? locale) {
    if (locale != Global.locale) {
      Global.locale = locale;
      Global.saveLocale();
      notifyListeners();
    }
  }

}
