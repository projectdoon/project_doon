import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mydoon/register.dart';
import 'package:mydoon/register_Screen1.dart';


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
            return RegisterScreen1(emailid: '',);
          }
          else {
            return RegisterScreen(); //
          }
        }
    );
  }
}
