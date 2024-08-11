import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class RegisterScreen2 extends StatefulWidget {
  const RegisterScreen2({super.key});

  @override
  State<RegisterScreen2> createState() => _RegisterScreen2State();
}

class _RegisterScreen2State extends State<RegisterScreen2> {
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
              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.only(left: 0.0,top: 35),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_sharp, color: Colors.black , size: 30,),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(child: Container()), // Spacer
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.only(left: 16.0),
                alignment: Alignment.centerLeft,
                child: const Padding(
                  padding: EdgeInsets.only(left: 0, top: 10),
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

              const SizedBox(height: 45),

              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 40.0),
                child: const Text(
                  'Address: ',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              const SizedBox(height: 27),

              SizedBox(
                width: 450,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 24, 118, 210),
                      elevation: 2.0, // Button shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // Rounded corners
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Button padding
                    ),
                    onPressed: () {
                      // Your onPressed logic here
                    },
                    child: const Text(
                      'Auto-Detect Location',
                      style: TextStyle(
                        color: Colors.white, // Text color
                        fontSize: 16, // Text size
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 40),

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
                    Radius.circular(12),
                  ),
                ),

                alignment: Alignment.center,

                child: const TextField(
                  decoration: InputDecoration(
                      hintText: 'Address Line 1',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 16.0)
                  ),
                ),




              ),

              SizedBox(height: 15),

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
                    Radius.circular(12),
                  ),
                ),

                alignment: Alignment.center,

                child: const TextField(
                  decoration: InputDecoration(
                      hintText: 'Address Line 2',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 16.0)
                  ),
                ),

              ),

              SizedBox(height: 15),

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
                    Radius.circular(12),
                  ),
                ),

                alignment: Alignment.center,

                child: const TextField(
                  decoration: InputDecoration(
                      hintText: 'Landmark(optional)',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 16.0)
                  ),
                ),

              ),

              SizedBox(height: 75),

              Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/loginscreenabstract.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,

                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height * 0.20, // Adjust the bottom padding based on screen height
                      ),

                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 24, 118, 210),
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          ),
                          onPressed: () {
                            // Navigator.push(context, CupertinoPageRoute(builder: (context) => const Homeui()));
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white, // Text color
                              fontSize: 16, // Text size
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

