
import 'package:flutter/material.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();
  static NavigatorService instance = NavigatorService();

  Future<dynamic> navigateTo(Widget destination) {
    return globalKey.currentState!
        .push(MaterialPageRoute(builder: (context) => destination));
  }

  void navigateBack() {
    return globalKey.currentState!.pop();
  }

  Future<dynamic> navigateToReplacement(Widget destination) {
    return globalKey.currentState!.pushReplacement(
      PageRouteBuilder(
          pageBuilder: (a, b, c) => destination,
          transitionDuration: Duration(seconds: 0)),
    );
  }
}