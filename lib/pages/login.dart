
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var smsCode = null;
  var phoneNumber = null;
  void phoneAuth() async{
    FirebaseAuth auth = FirebaseAuth.instance;

    ConfirmationResult confirmationResult = await auth.signInWithPhoneNumber(phoneNumber);
    if(smsCode != null){
      await confirmationResult.confirm(smsCode).whenComplete(() => Navigator.pop(context));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
           const SizedBox(
             height: 180,
           ),
           Stack(
             children: [
               Container(
                 child: const Image(
                   image: AssetImage('assets/login_ellipse.png'),
                   height: 130,
                   width: 130,
                 ),
               ),
               Container(
                 child: const Image(
                   image: AssetImage('assets/login_logo.png'),
                   height: 100,
                   width: 100,
                 ),
                 margin: EdgeInsets.all(13.5),
               )
             ],
           ),
           const SizedBox(
             height: 60,
           ),
           Padding(
            padding:  EdgeInsets.symmetric(horizontal: 25),
            child:  TextField(obscureText: false,
                  onChanged: (text){
                    phoneNumber = text;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Номер телефона',
                      labelStyle: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w300,
                        color: Color(0xff807E7E),
                        fontSize: 22,
                      ),
                  ),
                ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 25),
            child: TextField(obscureText: false,
              onChanged: (text){
                smsCode = text;
              },
              decoration: const InputDecoration(
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
          ),
          const SizedBox(
            height: 30,
          ),
          RaisedButton(
              child: Text('Вход'),
              onPressed:  (){
                /*FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: phoneNumber,
                  //timeout: const Duration(seconds: 30),
                  verificationCompleted: (PhoneAuthCredential credential) {
                    FirebaseAuth.instance.signInWithCredential(credential).whenComplete(() => Navigator.pop(context));

                  },
                  verificationFailed: (FirebaseAuthException e) {},
                  codeSent: (String verificationId, int? resendToken) {

                    PhoneAuthCredential credential
                      = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
                    FirebaseAuth.instance.signInWithCredential(credential).whenComplete(() => Navigator.pop(context));
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {},
                );*/

              }),
        ],
      ),
    );
  }
}
