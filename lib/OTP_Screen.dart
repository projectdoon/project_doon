import 'dart:ffi';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:mydoon/register_Screen1.dart';

import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen({super.key, required this.verificationID, required this.phoneNo});

  String verificationID;
  var phoneNo;

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
          color: Color.fromARGB(255, 255, 255, 255),
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
                    'OTP',
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Text(
                      'NOT RECIEVED?',
                    ),
                  ),
                  Container(
                    child: TextButton(
                      style: TextButton.styleFrom(foregroundColor: Colors.blue),
                      child: Text('CHANGE NUMBER'),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Pinput(
                keyboardType: TextInputType.phone,
                autofocus: false,
                length: 6,
                defaultPinTheme: defaultPinTheme,
                followingPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    color: Color.fromARGB(255, 255, 255, 255),
                    border: Border.all(color: Colors.black),
                  ),
                ),
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    color: Color.fromARGB(255, 255, 255, 255),
                    border: Border.all(color: Colors.black),
                  ),
                ),
                onChanged: (value) {
                  otpValue = value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 24, 118, 210),
                        elevation: 0.1,
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 30, // Icon color
                      ),
                      // onPressed: () async {
                      //   try {
                      //     PhoneAuthCredential credential =
                      //         await PhoneAuthProvider.credential(
                      //             verificationId: widget.verificationID,
                      //             smsCode: otpValue.toString());
                      //     FirebaseAuth.instance
                      //         .signInWithCredential(credential)
                      //         .then((value) {
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) => RegisterScreen1(),
                      //         ),
                      //       );
                      //     });
                      //   } catch (ex) {
                      //     log(ex.toString() as num);
                      //   }
                      // },
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => RegisterScreen1(phoneNo: widget.phoneNo,),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 214),
                child: Image.asset(
                  'assets/loginscreenabstract.png',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
