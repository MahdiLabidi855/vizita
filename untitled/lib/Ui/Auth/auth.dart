import 'package:flutter/material.dart';

import '../../Var/variable.dart';
import '../login_screen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final List<Widget> header = [
    SizedBox(
      height: 10,
    ),
    LoginScreen(),
    Spacer(),
    Container(
      margin: EdgeInsets.only(
          top: screenHeight * 0.010, bottom: screenHeight * 0.010),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Powered by :",
            style: TextStyle(
                color: white, fontFamily: 'Helvetica', fontSize: textSize),
          ),
          Image.asset('assets/images/logo-ia.png',width: 90,)
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor:greenO1OOP,
        title: Row(
          children: [
            SizedBox(
              width: 10,
            ),Image.asset("assets/images/logo-vizita-color-h.png",width: 180,),

          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [greenO1OOP,blueO1OOP],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: screenHeight,
          ),
          child: ListView(
            children: header,
          ),
        ),
      ),
    );
  }
}
