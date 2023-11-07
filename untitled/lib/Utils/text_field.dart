
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../var/variable.dart';

Widget getTextField(String text, IconData icon, bool isPassword,
    TextEditingController controller) {
  return Padding(
    padding:  EdgeInsets.symmetric(horizontal:screenWidth-(screenWidth-20)),
    child: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: grey,
            spreadRadius: 2, 
            blurRadius: 5, 
            offset: Offset(0, 3), 
          ),
        ],
      ),
      child: AnimatedTextField(
        label: text,
        suffix: Icon(icon),
        textController: controller,
        isPassword: isPassword,

      ),
    ),
  );
}

class AnimatedTextField extends StatefulWidget {
  AnimatedTextField({
    Key? key,
    required this.label,
    required this.suffix,
    required this.textController,
    required this.isPassword,
  }) : super(key: key);

  final String label;
  final Widget? suffix;
  TextEditingController textController;
  final bool isPassword;

  @override
  _AnimatedTextFieldState createState() => _AnimatedTextFieldState();
}

class _AnimatedTextFieldState extends State<AnimatedTextField>
    with SingleTickerProviderStateMixin {
  late final FocusNode _focusNode;
  late final AnimationController _controller;
  late final Animation<double> _animation;

  bool _isFocused = false;
  bool _isVisibe = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
        if (_isFocused) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: _isFocused ? blue : grey,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.8),
            ),
            child: child,
          );
        },
        child: TextField(
          onChanged: (value) async {
            final userInstance = await SharedPreferences.getInstance();
            if (widget.label == "Email") {
              setState(() async {
                passwordTextController.text =
                userInstance.getString('${value}_password').toString() !=
                    "null"
                    ? userInstance.getString('${value}_password').toString()
                    : '';
              });
            }
          },
          controller: widget.textController,
          focusNode: _focusNode,
          obscureText: _isVisibe ? false : widget.isPassword,
          decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: TextStyle(
              color: _isFocused ? blue : black,
            ),
            suffixIcon: _isFocused || widget.textController.text.isNotEmpty
                ? widget.isPassword
                ? IconButton(
              icon: Icon(
                _isVisibe ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _isVisibe = !_isVisibe;
                });
              },
            )
                : widget.suffix
                : widget.suffix,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
          ),
          keyboardType: widget.isPassword
              ? TextInputType.visiblePassword
              : TextInputType.emailAddress,
        ),
      ),
    );
  }
}
