import 'package:flutter/material.dart';

class AppUtils {
  static String assetsName(String name, String folder,
      {String extenstion = 'png'}) {
    return 'assets/$folder/$name.$extenstion';
  }

  static void navigateWithClear(Widget child, BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => child), (route) => false);
  }

  static void navigate(Widget child, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => child));
  }
}
