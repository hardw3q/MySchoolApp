
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var smsCode = null;
  var phoneNumber = null;
  var buttonState = 0;
  bool smsFieldEnabled = false;
  bool phoneFieldEnabled = true;
  String buttonText = 'Отправить SMS';
  late ConfirmationResult confirmationResult;

  void phoneWebAuth() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (phoneNumber != null && phoneNumber.length == 12) {
      confirmationResult =
      await auth.signInWithPhoneNumber(phoneNumber, null).whenComplete(() {
        setState(() {
          buttonState = 1;
          buttonText = 'Вход';
          smsFieldEnabled = true;
          phoneFieldEnabled = false;
        });
      });
    }else{
      Fluttertoast.showToast(
          msg: 'Произошла ошибка при отправке кода ',
          toastLength: Toast.LENGTH_SHORT);
    }
  }

  void confirmSmsCodeWeb() {
    if (smsCode != null && smsCode.length == 6) {
      confirmationResult.confirm(smsCode)
          .whenComplete((){
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/', (Route<dynamic> route) => false);
          buttonState == 0;
          RecaptchaVerifier().clear();
      });
    }else{
      Fluttertoast.showToast(
          msg: 'Произошла ошибка при входе',
          toastLength: Toast.LENGTH_SHORT);
    }
  }
    void phoneAndroidAuth() async {
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
    }
    @override
    Widget build(BuildContext context) {
      return Material(
        child: Column(
          children: [
            const SizedBox(
              height: 160,
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
              height: 7,
            ),
            Text('Моя Школа', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, fontFamily: 'Roboto')),
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: TextField(obscureText: false,
                enabled: phoneFieldEnabled,
                onChanged: (text) {
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
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: TextField(obscureText: false,
                enabled: smsFieldEnabled,
                onChanged: (text) {
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
                child: Text(buttonText),
                onPressed: () {
                  if (buttonState == 0) {
                    phoneWebAuth();
                  } else {
                    confirmSmsCodeWeb();
                  }
                },
            ),
          ],
        ),
      );
    }
  }
