import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mydoon/Backend/MongoDB.dart';
import 'package:mydoon/register.dart';
import 'package:mydoon/start_screen.dart';
import 'package:mydoon/state.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(home: StartScreen(),));
}

