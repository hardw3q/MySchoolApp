import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myschoolapp/pages/hashtag.dart';
import 'package:myschoolapp/pages/messanger.dart';
import 'package:myschoolapp/pages/news.dart';
import 'package:myschoolapp/pages/profile.dart';

class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  int _selectedIndex = 0;
  final wiget = [News(),Messanger(), HashTag(), Profile()];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: wiget[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10)
            ],
          ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            onTap: _onItemTapped,
            backgroundColor: Color(0xff8A8181),
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.white60,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.amp_stories_sharp),
                title: Text('Hashtag'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.fiber_new),
                title: Text('News'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message_outlined),
                title: Text('Messages'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people_rounded),
                title: Text('Profile'),
              ),
            ],
          ),
        ),
        )
      );
  }
}

