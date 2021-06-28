import 'package:flutter/material.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Кто прочитал тот лох'),
           Image.network('https://cdn.akamai.steamstatic.com/steamcommunity/public/images/avatars/25/25cd22f63a5cc718eb06c4490e2fa3be5cb60c8d_full.jpg')],
      ),
    );
  }
}
