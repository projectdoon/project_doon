import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mydoon/register_Screen2.dart';
import 'package:mydoon/start_screen.dart';

class RegisterScreen1 extends StatefulWidget {
  RegisterScreen1({super.key,required this.emailid});

  String emailid;

  @override
  State<RegisterScreen1> createState() => _RegisterScreen1State();
}

class _RegisterScreen1State extends State<RegisterScreen1> {
  final firstNameController = new TextEditingController();
  final lastNameController = new TextEditingController();
  final phoneNumberController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              // Container(
              //
              // ),

              Container(
                padding: const EdgeInsets.only(left: 16.0),
                alignment: Alignment.centerLeft,
                child: const Padding(
                  padding: EdgeInsets.only(left: 0, top: 115),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontFamily: 'FontMain/Product Sans Bold.ttf',
                      fontSize: 50,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 27),

              Container(
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
                alignment: Alignment.center,
                child: TextField(
                  controller: firstNameController,
                  decoration: const InputDecoration(
                      hintText: 'First Name as Per Aadhar',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 16.0)),
                ),
              ),

              const SizedBox(height: 27),

              Container(
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
                alignment: Alignment.center,
                child: TextField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                      hintText: 'Last Name as Per Aadhar',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 16.0)),
                ),
              ),

              const SizedBox(height: 27),

              Container(
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
                alignment: Alignment.center,
                child: TextField(
                  controller: phoneNumberController,
                  decoration: const InputDecoration(
                      hintText: 'Mobile Number as Per Aadhar',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 16.0)),
                ),
              ),

              const SizedBox(height: 27),

              Container(
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
                alignment: Alignment.center,
                child: const TextField(
                  decoration: InputDecoration(
                      hintText: 'Water Bill Customer Id (optional)',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 16.0)),
                ),
              ),

              const SizedBox(height: 27),

              Container(
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
                alignment: Alignment.center,
                child: const TextField(
                  decoration: InputDecoration(
                      hintText: 'Electricity Bill Customer Id (optional)',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 16.0)),
                ),
              ),

              const SizedBox(
                height: 45,
              ),

              Container(
                width: 180,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color.fromARGB(255, 0, 87, 115), // Button color
                    elevation: 5.0, // Button shadow
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded corners
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12), // Button padding
                  ),
                  onPressed: () {
                    print(widget.emailid);
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => RegisterScreen2(
                                  fname: firstNameController.text,
                                  lname: lastNameController.text,
                                  phoneno: phoneNumberController.text,
                              email: widget.emailid,
                                )));
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white, // Text color
                      fontSize: 16, // Text size
                    ),
                  ),
                ),
              ),
              Image.asset(
                'assets/loginscreenabstract.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
