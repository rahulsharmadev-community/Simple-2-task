import 'package:flutter/material.dart';

abstract class HelpClass {
  static showSnackBar(BuildContext context, String title) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
  }
}
