import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mydoon/Backend/MongoDB.dart';
import 'package:mydoon/config.dart';
import 'package:mydoon/start_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home_Screen_ui/Navigation_menu.dart';

import 'OTP_Screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await MongoDatabase.connect();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp(token: prefs.getString('token'),));
}

class MyApp extends StatelessWidget{
  const MyApp({super.key,required this.token});

  final token;

  @override
  Widget build(BuildContext context) {
    // getIpAddress();
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: (JwtDecoder.isExpired(token)==false)?NavigationMenu(token: token,):StartScreen(),
    );
  }
}
