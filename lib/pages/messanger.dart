import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bottom_nav_bar.dart';

class Messanger extends StatefulWidget {
  const Messanger({Key? key}) : super(key: key);

  @override
  _MessangerState createState() => _MessangerState();
}

class _MessangerState extends State<Messanger> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        extendBody: true,
        bottomNavigationBar: NavigationBar(),
        body: Container(

        ),
      );
  }
}