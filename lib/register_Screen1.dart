import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen1 extends StatefulWidget {
  const RegisterScreen1({super.key});

  @override
  State<RegisterScreen1> createState() => _RegisterScreen1State();
}

class _RegisterScreen1State extends State<RegisterScreen1> {
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 0, top: 115),
                  child: Text(
                    'Register',
                    style: GoogleFonts.poppins(
                      fontSize: 45,
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

                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'First Name as Per Aadhar',
                    border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 16.0)
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

                child: const TextField(
                  decoration: InputDecoration(
                      hintText: 'Last Name as Per Aadhar',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 16.0)
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

                child: const TextField(
                  decoration: InputDecoration(
                      hintText: 'Mobile Number as Per Aadhar',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 16.0)
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

                child: const TextField(
                  decoration: InputDecoration(
                      hintText: 'Water Bill Customer Id (optional)',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 16.0)
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

                child: const TextField(
                  decoration: InputDecoration(
                      hintText: 'Electricity Bill Customer Id (optional)',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 16.0)
                  ),
                ),


              ),

              const SizedBox(
                height: 45,
              ),



              Container(
                width: 180,
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 87, 115), // Button color
                    elevation: 5.0, // Button shadow
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0), // Rounded corners
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), // Button padding
                  ),
                  onPressed: () {
                    // Your onPressed logic here
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
