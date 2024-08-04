import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'authServices/auth.dart';
import 'home.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Center(

        child:
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: ElevatedButton(
            onPressed: () async {
              try {
                UserCredential? userCredential = await _auth.logInWithGoogle();
                if (userCredential != null) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                }
              } catch (e) {
                if (kDebugMode) {
                  print("Error logging in with Google: $e");
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 88, 176, 203),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/google-icon.svg', // Ensure this path is correct
                  height: 19,
                ),
                const SizedBox(width: 7),
                const Text(
                  'CONTINUE WITH GOOGLE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ],
            ),
          ),
        ),

        ),
      ),
    );
  }
}


