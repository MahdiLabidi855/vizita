
import 'package:flutter/material.dart';
import 'package:untitled/var/variable.dart';

Container customButton(String text, BuildContext context, Function onTap) {
  return Container(
      width: buttonWidth,
      height: buttonHeight,
      margin:  EdgeInsets.fromLTRB(screenWidth*0.01, screenWidth*0.004, screenWidth*0.01, screenWidth*0.004),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(1)),
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        child: Text(
          text,
          style:  TextStyle(
              color: white, fontWeight: FontWeight.bold, fontSize: textSize,fontFamily: 'Helvetica'),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return blue;
              }
              return blue;
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3)))),
      ));
}
