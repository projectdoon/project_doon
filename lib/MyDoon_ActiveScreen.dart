import 'package:flutter/material.dart';
import 'package:mydoon/start_screen.dart';


class MydoonActivescreen extends StatefulWidget {


  @override
  State<MydoonActivescreen> createState() {
    return _MyDoonACtiveSCreenState();
  }
}

class _MyDoonACtiveSCreenState extends State<MydoonActivescreen> {
  var activeScreen = 'StartScreen';

  void switchScreen(String accept) {
    setState(() {
      activeScreen = accept;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen();

    // if (activeScreen == 'signUpPage') {
    //   screenWidget = StartScreen();
    // }
    //
    // if (activeScreen == 'phoneNumberScreen') {
    //   screenWidget = const PhoneNoAuth();
    // }
    // // if (activeScreen == 'otpscreen') {
    // //   screenWidget = OtpScreen(verificationID: '123456');
    // // }

    return Scaffold(
      body: screenWidget,
    );
  }
}
