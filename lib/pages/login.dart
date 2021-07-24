
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
           const ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35.0),
                topRight: Radius.circular(35.0),
              ),
              child: TextField(obscureText: false,
                decoration: InputDecoration(
                    labelText: 'Номер телефона',
                    labelStyle: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w100,
                      color: Color(0xff807E7E),
                      fontSize: 22,
                    )
                ),
              ),
            ),
          const TextField(obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Код из SMS',
              labelStyle: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w300,
                  color: Color(0xff807E7E),
                  fontSize: 22
              )
            ),
          ),
          RaisedButton(
              child: Text('Вход'),
              onPressed:(){
                  Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
