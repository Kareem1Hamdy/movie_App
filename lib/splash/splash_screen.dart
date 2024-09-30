import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/main_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(child: Image.asset('assets/images/movies_splash.png')),
          AnimatedSplashScreen(
            nextScreen: MainScreen(),
            splash: const Text(''),
            backgroundColor: Colors.transparent,
          )
        ],
      ),
    );
  }
}
