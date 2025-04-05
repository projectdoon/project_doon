import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mydoon/Providers/auth_provider.dart';
import 'package:mydoon/Services/auth_services.dart';
import 'package:mydoon/register_Screen1.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home_Screen_ui/Navigation_menu.dart';
import 'configuration/config.dart';

class OTPScreen extends ConsumerStatefulWidget {
  OTPScreen({super.key, required this.verificationID, required this.phoneNo});

  String verificationID;
  String phoneNo;

  @override
  ConsumerState<OTPScreen> createState() {
    return _OTPScreenState();
  }
}

class _OTPScreenState extends ConsumerState<OTPScreen> {
  final _OTPController = TextEditingController();
  late SharedPreferences prefs;
  var otpValue = null;

  @override
  void initState() {
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  void loginUser() async {
    print('login user function called');
    String phoneNo =
        widget.phoneNo.toString(); // Convert to String if not already
    String modifiedPhoneNo =
        phoneNo.substring(3); // Remove the first two characters
    var phoneNumber =
        int.tryParse(modifiedPhoneNo); // Convert the remaining string to int


    print(phoneNumber);
    if (otpValue != null) {
      var reqBody = {"phoneNo": phoneNumber};

      print('phone number value fetched');

      try {
        var response = await http.post(Uri.parse(Config.login),
            headers: {"content-type": "application/json"},
            body: jsonEncode(reqBody));
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse['status']);

        if (jsonResponse['status'] == true) {
          var myToken = jsonResponse['token'];
          handleLogin(ref, myToken);

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("logged in Successfully"),
          ));
          Navigator.pushAndRemoveUntil(
            context,
            CupertinoPageRoute(
              builder: (context) => NavigationMenu(),
            ),
            (Route<dynamic> route) => false,
          );
        } else {
          print('something went wrong');

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("please register yourself"),
          ));
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => RegisterScreen1(phoneNo: widget.phoneNo),
            ),
          );
        }
      } catch (err) {
        print(err);
      }
    }
  }

  @override
  void dispose() {
    _OTPController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    margin: const EdgeInsets.only(left: 30),
                    child: const Text(
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
                      onPressed: () async {
                        try {
                          PhoneAuthCredential credential =
                              await PhoneAuthProvider.credential(
                                  verificationId: widget.verificationID,
                                  smsCode: otpValue.toString());
                          FirebaseAuth.instance
                              .signInWithCredential(credential)
                              .then((value) {
                            loginUser();
                          });
                        } catch (ex) {
                          print(ex);
                        }
                      },
                      // onPressed: () {
                      //   loginUser();
                      //
                      // },
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
