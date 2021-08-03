import 'package:flutter/material.dart';
import 'package:myschoolapp/elements/post.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        extendBody: true,
          body: Center(
            child: Post('d', 'd', 'd'),
          ),
    );
  }
}
