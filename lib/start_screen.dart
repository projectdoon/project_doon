import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mydoon/register.dart';
import 'authServices/auth.dart';

import 'OTP_Screen.dart';
import 'authServices/auth.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() {
    return _StartScreenState();
  }
}

class _StartScreenState extends State<StartScreen> {
  final _phoneNumberController = TextEditingController();
  var phoneNumberInput = null;
  final _auth = AuthService();
  String phoneNo = "+91";

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(left: 0, top: 115),
                  child: Text(
                    'WELCOME',
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              //google login button
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),

                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        UserCredential? userCredential =
                            await _auth.logInWithGoogle();
                        AuthService authService = AuthService();
                        if (userCredential != null) {
                          Map<String, dynamic>? userDetails =
                              await authService.getUserDetails();
                          print('$userDetails');

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()),
                          );
                        }
                      } catch (e) {
                        if (kDebugMode) {
                          print("Error logging in with Google: $e");
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shadowColor: Color.fromARGB(255, 24, 118, 210),
                      padding: EdgeInsets.only(top: 13,bottom: 13),
                      side: const BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/google-icon.svg', // Ensure this path is correct
                          height: 19,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'CONTINUE WITH GOOGLE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              //google login button end
              const SizedBox(
                height: 50,
              ),



              Container(
                height: 45,
                width: 335,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    autofocus: true,
                    controller: _phoneNumberController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 130, 130, 130),
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                      hintText: 'PLease Enter Your Phone Number',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(174, 0, 87, 115),
                  elevation: 0.1,
                  shape: const CircleBorder(
                    side: BorderSide(
                      color: Colors.transparent, // Border color
                      width: 0.5, // B
                      // order width
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 30, // Icon color
                ),
                onPressed: () async {
                  phoneNo = phoneNo + _phoneNumberController.text.toString();
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException ex) {},
                    codeSent: (String verificationid, int? resendToken) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OTPScreen(
                            verificationID: verificationid,
                          ),
                        ),
                      );
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                    phoneNumber: phoneNo.toString(),
                  );
                },
              ),
              const SizedBox(
                height: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
