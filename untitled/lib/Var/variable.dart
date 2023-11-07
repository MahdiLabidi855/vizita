import 'package:flutter/material.dart';
import 'dart:ui' as ui;

TextEditingController passwordTextController = TextEditingController();


var blue = const Color(0xff00328d);
const black = Color(0xFF1E1E1E);
const grey = Colors.grey;
const white = Colors.white;
const whiteb = Color(0xFFBEBEBE);
const red = Color(0xFFFF0000);
const greenO35P = Color(0x5944FF98);
const greenO1OOP = Color(0xFF44FF98);
const blueO1OOP = Color(0xFF80BAE6);

final Size screenSize = ui.window.physicalSize;
final double screenWidth = screenSize.width;
final double screenHeight = screenSize.height;
final double textSize=(screenWidth*screenHeight)/((screenWidth+screenHeight)*30);
final double logoSize=(screenWidth*screenHeight)/((screenWidth+screenHeight)*10);
final double buttonWidth=screenWidth-400;
final double buttonHeight=40;
final bool DarkTheme=true;

int homeScreenIndex=0;

