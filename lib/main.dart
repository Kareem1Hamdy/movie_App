import 'package:flutter/material.dart';
import 'package:movie_app/provider/app_provider.dart';
import 'package:movie_app/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      ChangeNotifierProvider(
      create: (context) =>AppProvider(),
     child: const MyApp())
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    if(provider.userCredential==null){
      provider.login();
    }
    return MaterialApp(
     home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

