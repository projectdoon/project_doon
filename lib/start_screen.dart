import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:mydoon/register_Screen1.dart';
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
  final phoneNumberController = TextEditingController();
  var phoneNumberInput = null;
  final _auth = AuthService();
  String phoneNo = "+91";

  @override
  void dispose() {
    phoneNumberController.dispose();
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
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: const Padding(
                  padding: EdgeInsets.only(left: 0, top: 115),
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                      fontFamily: 'FontMain/Product Sans Bold.ttf',
                      fontSize: 50,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 45),
              const SizedBox(
                height: 25,
              ),
              Container(
                padding: EdgeInsets.only(left: 12),
                height: 45,
                width: 325,
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
                child: Row(
                  children: [
                    Text(
                      '+91 :',
                      style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: TextField(
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                          autofocus: false,
                          controller: phoneNumberController,
                          textAlign: TextAlign.start,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: Icon(
                              Icons.phone_enabled_outlined,
                            ),
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 130, 130, 130),
                                fontSize: 19,
                                fontWeight: FontWeight.normal),
                            hintText: 'Phone No.',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
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
                      onPressed: () async {
                        try {
                          phoneNo =
                              phoneNo + phoneNumberController.text.toString();
                          await FirebaseAuth.instance.verifyPhoneNumber(
                              verificationCompleted:
                                  (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException ex) {},
                              codeSent:
                                  (String verificationid, int? resendtoken) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OTPScreen(
                                      verificationID: verificationid,
                                      phoneNo: phoneNo,
                                    ),
                                  ),
                                );
                              },
                              codeAutoRetrievalTimeout:
                                  (String verificationId) {},
                              phoneNumber: phoneNo);

                          phoneNumberController.clear();
                        } catch (ex) {
                          print('hehfurhfufhe');
                          print(ex);
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              Container(
                margin: const EdgeInsets.only(top: 150),
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
