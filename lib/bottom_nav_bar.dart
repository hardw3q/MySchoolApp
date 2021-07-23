import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget{
  static int _selectedIndex = 0;

  @override
  NavigationBarState createState() => NavigationBarState();

}
class NavigationBarState extends State<NavigationBar> {
  void _onItemTapped(int index) {
    setState(() {
      NavigationBar._selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
        currentIndex: NavigationBar._selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        //backgroundColor: Color(0x00ffffff), // transparent
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.blue,
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
        ]
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}