import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mydoon/Backend/MongoDB.dart';
import 'package:mydoon/state.dart';
import 'Home_Screen_ui/Navigation_menu.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    theme: ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.blue,
    ),
    debugShowCheckedModeBanner: false,
    home:  NavigationMenu(),))
  ;
}




