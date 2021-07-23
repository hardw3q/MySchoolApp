import 'package:flutter/material.dart';
import 'package:myschoolapp/root.dart';
import 'package:myschoolapp/pages/hashtag.dart';
import 'package:myschoolapp/pages/messanger.dart';
import 'package:myschoolapp/pages/news.dart';
import 'package:myschoolapp/pages/profile.dart';

void main() {
  runApp(MaterialApp(
    theme: new ThemeData(
      primaryColor: Colors.grey
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => Root(),

      '/hashtag': (context) => HashTag(),
      '/messanger': (context) => Messanger(),
      '/profile': (context) => Profile()
    },
  ));
}
