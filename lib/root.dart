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
            //selectedItemColor: Colors.white,
            selectedIconTheme: IconThemeData(
              size: 40
            ),
            unselectedIconTheme: IconThemeData(
              size: 30
            ),
            onTap: _onItemTapped,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            backgroundColor: Color(0xff8A8181),
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            //unselectedItemColor: Colors.white60,
            items:  const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/Hashtag.png"),),
                title: Text('Hashtag'),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/News.png')),
                title: Text('News'),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/Chat.png')),
                title: Text('Messages'),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/Name.png')),
                title: Text('Profile'),
              ),
            ],
          ),
        ),
        )
      );
  }
}

