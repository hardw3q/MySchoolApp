import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bottom_nav_bar.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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