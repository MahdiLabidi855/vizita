import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Cubit/splash/splash_cubit.dart';
import '../../Cubit/splash/splash_state.dart';
import '../../Var/variable.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(),
      child: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          if (state is SplashInitialState) {
            // Start the animation when the initial state is detected
            context.read<SplashCubit>().startAnimation();
          } else if (state is ErrorSplashState) {
            return Scaffold(
              body: Center(
                child: Text("Error: ${state.message}"),
              ),
            );
          }

          return AnimatedLogo();
        },
      ),
    );
  }
}

class AnimatedLogo extends StatefulWidget {
  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    final curve = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);
    _animation = Tween<double>(begin: -100, end: 100).animate(curve)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [greenO1OOP, blueO1OOP],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, -_animation.value),
                    child: Image.asset(
                      "assets/images/logo-vizita-color.png",
                      width: 150,
                    ),
                  );
                },
              ),
              Spacer(),
              Text(
                'HELLO',
                style: TextStyle(
                  fontSize: 40,
                  letterSpacing: 2,
                  color: white,
                  shadows: [
                    Shadow(
                      color: black,
                      offset: Offset(-3, 2),
                      blurRadius: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
