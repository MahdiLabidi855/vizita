import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/text_field.dart';
import '../var/custom_button.dart';
import '../var/variable.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userEmailTextController = TextEditingController();
  bool isRemembered = false;

  Color _getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return white;
    }
    return white;
  }

  void _rememberData() async {

  }


  @override
  Widget build(BuildContext context) {
    _rememberData();
    return Container(

      child: Column(
        children: [
          SizedBox(height: 10,),
          Container(
            height: 1.5,
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                  color: grey,
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
          ),
          SizedBox(height: 100,),
          getTextField("Email", Icons.mail_outline_rounded, false,
              _userEmailTextController),
          SizedBox(height: screenHeight*0.006,),
          getTextField("Password", Icons.lock, true, passwordTextController),
          Row(
            children: [
              Transform.scale(
                scale: screenHeight*0.0007,
                child: Checkbox(
                    value: isRemembered,
                    fillColor: MaterialStateProperty.resolveWith(_getColor),
                    onChanged: (bool? value) {
                      setState(() {
                        isRemembered = value!;
                      });
                    }),
              ),
              Text(
                "Remember Me",
                style: TextStyle(color: black,
                  fontFamily: 'Helvetica',
                ),
              ),
            ],
          ),
          customButton('Sign In', context, () async {
            if (_userEmailTextController.text.isEmpty) {
              var snackBar = SnackBar(content: Text('Email is empty'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              if (passwordTextController.text.isEmpty) {
                var snackBar = SnackBar(content: Text('Password is empty'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            } else {
              if (isRemembered) {
                final userInstance = await SharedPreferences.getInstance();
                await userInstance.setString(
                    'lastEmail', _userEmailTextController.text);
                await userInstance.setString(
                    '${_userEmailTextController.text}_password',
                    passwordTextController.text);
              }
            }
          }),
          Row(children: <Widget>[
            Expanded(
              child: Container(
                  margin:
                  EdgeInsets.only(left: screenWidth*0.01, right: screenWidth*0.01),
                  child:  Divider(
                    color: grey,
                    height: screenHeight*0.02,
                  )),
            ),

            const Text("OR", style: TextStyle(color: grey),),
            Expanded(
              child: Container(
                  margin:
                  EdgeInsets.only(left: screenWidth*0.01, right: screenWidth*0.01),
                  child:  Divider(
                    color: grey,
                    height: screenHeight*0.02,
                  )),
            ),
          ]),

          Padding(padding: EdgeInsets.symmetric(horizontal: screenWidth*0.01),
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    minimumSize: Size(buttonWidth, buttonHeight),

                    padding:
                    EdgeInsets.only(left: screenWidth*0.01, right: screenWidth*0.01)),
                icon: Image.asset('assets/images/google.png',width: screenWidth*0.03,),
                label: const Text('  Login with Google'),
                onPressed: () {

                }),
          ),
        ],
      ),



    );
  }



}
