import 'package:flutter/material.dart';
import 'package:myschoolapp/pages/news.dart';

void main() {
  runApp(MaterialApp(
    theme: new ThemeData(
      primaryColor: Colors.grey
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => News()
    },
  ));
}
