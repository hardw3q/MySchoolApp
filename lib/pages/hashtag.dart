import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HashTag extends StatefulWidget {
  const HashTag({Key? key}) : super(key: key);

  @override
  _HashState createState() => _HashState();
}

class _HashState extends State<HashTag> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        extendBody: true,
        body: Center(
          child: Text('This is hashtag'),
        ),
      );
  }
}