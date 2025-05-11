import 'package:flutter/cupertino.dart';

class SwitchPage {
  static void Function() switchPage(BuildContext context, Widget page) {
    return () {
      Navigator.of(
        context,
      ).push(CupertinoPageRoute(builder: (context) => page));
    };
  }
}
