import 'package:flutter/material.dart';
import 'package:movie_app/Home%20Screen/home_screen.dart';
import 'package:movie_app/main_screen.dart';
import 'package:movie_app/provider/app_provider.dart';
import 'package:movie_app/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
      create: (context) =>AppProvider(),
     child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

