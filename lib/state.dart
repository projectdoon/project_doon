import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:mydoon/start_screen.dart';

import 'Home_Screen_ui/Navigation_menu.dart';

class CheckState extends StatelessWidget {
  const CheckState({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:(context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasData) {
            return NavigationMenu();
          }
          else {
            return NavigationMenu(); //
          }
        }
    );
  }
}


