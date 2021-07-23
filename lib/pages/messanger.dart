import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
        body: Center(
          child: Text('This is messanger'),
        ),
      );
  }
}