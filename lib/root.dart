import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:myschoolapp/pages/hashtag.dart';
import 'package:myschoolapp/pages/messanger.dart';
import 'package:myschoolapp/pages/news.dart';
import 'package:myschoolapp/pages/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  int _selectedIndex = 0;
  final wiget = [HashTag(),News(), Messanger(), Profile()];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void initFirebase(){
    Firebase.initializeApp().catchError((error, stacktrace){
      Navigator.pushNamed(context, '/login');
    }).whenComplete((){
      FirebaseAuth auth = FirebaseAuth.instance;
      auth.authStateChanges().listen((User? user) {
        if(user == null){
          Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
        }
      });
    });
  }
  @override
  void initState() {
    super.initState();
    initFirebase();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: wiget[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(35), topLeft: Radius.circular(35)),
          ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(35.0),
            topRight: Radius.circular(35.0),
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

