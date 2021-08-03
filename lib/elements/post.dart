import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  var postText;
  var postTime;
  var postTag;
  var postDownRating;
  var PostUpRating;
  Post(var postText, var postTime, var postTag,){
       this.postText = postText;
       this.postTime = postTime;
       this.postTag = postTag;
    }

  @override
  _PostState createState() => _PostState(postText, postTime, postTag);
}

class _PostState extends State<Post> {
  var postText;
  var postTime;
  var postTag;
  var postDownRating;
  var PostUpRating;
  _PostState(var postText, var postTime, var postTag){
    this.postText = postText!;
    this.postTime = postTime!;
    this.postTag = postTag!;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(postText),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1
        )
      ),
    );
  }
}
