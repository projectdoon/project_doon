import 'dart:ffi';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:mydoon/register_Screen1.dart';

import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen({super.key, required this.verificationID});

  String verificationID;

  @override
  State<OTPScreen> createState() {
    return _OTPScreenState();
  }
}

class _OTPScreenState extends State<OTPScreen> {
  final _OTPController = TextEditingController();

  @override
  void dispose() {
    _OTPController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var otpValue = null;
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(108, 255, 255, 255),
        border: Border.all(color: Colors.transparent),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    );

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 83, 185, 216),
        ),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 28, top: 120),
                  child: Text(
                    'ENTER YOUR OTP',
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 100),
              Pinput(
                keyboardType: TextInputType.phone,
                autofocus: true,
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(color: Colors.white),
                  ),
                ),
                onChanged: (value) {
                  otpValue = value;
                },
              ),
              const SizedBox(
                height: 30,
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
                  try {
                    PhoneAuthCredential credential =
                        await PhoneAuthProvider.credential(
                            verificationId: widget.verificationID,
                            smsCode: otpValue.toString());
                    FirebaseAuth.instance
                        .signInWithCredential(credential)
                        .then((value) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen1(),
                        ),
                      );
                    });
                  } catch (ex) {
                    log(ex.toString() as num);
                  }
                },
              ),
              const SizedBox(
                height: 70,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                    'assets/hand-drawn-dog-outline-illustration_23-2149263522-removebg-preview.png',
                    width: 300,
                    color: const Color.fromARGB(223, 255, 255, 255)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
