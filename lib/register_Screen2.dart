import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:mydoon/Backend/MongoDB.dart';
import 'package:mydoon/Home_Screen_ui/Navigation_menu.dart';
import 'package:mydoon/Home_Screen_ui/home_screen.dart';

import 'Backend/MongoDBModel.dart';

class RegisterScreen2 extends StatefulWidget {
  RegisterScreen2({
    super.key,
    required this.fname,
    required this.lname,
    required this.phoneno,
  });

  final fname;
  final lname;
  var phoneno;

  @override
  State<RegisterScreen2> createState() => _RegisterScreen2State();
}

class _RegisterScreen2State extends State<RegisterScreen2> {
  var address1 = TextEditingController(text: '');

  @override
  void dispose() {
    address1.dispose();
    super.dispose();
  }

  String? Location;
  var lat;
  var long;

  getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print("Location denied");
      LocationPermission ask = await Geolocator.requestPermission();
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      print('hiiiiiiii');
      print(widget.fname);
      lat = currentPosition.latitude;
      long = currentPosition.longitude;

      print(lat);
      print(long);
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);

      setState(() {
        Location =
            "${placemarks[0].street!} ${placemarks[0].locality!} ${placemarks[1].locality!} ${placemarks[1].postalCode!} ${placemarks[0].administrativeArea} ${placemarks[0].country} ";

        address1.text = Location!;
      });

      // print(Location);
    }
  } //

  Future<void> _insertdata(var fname, var lname,  var phoneno,
      var lat, var long) async {
    print('cllllll');
    var _id = mongo.ObjectId();
    final data = MongoDbModel(
        id: _id,
        firstName: fname,
        lastName: lname,
        phoneNo: phoneno,
        homelocationLatitude: lat,
        homelocationLongitutde: long,
        currentlocationLatitude: 0,
        currentlocationLongitutde: 0);

    var result = await MongoDatabase.insert(data);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('registered successfully !!'),
    ));
    _clearAll();
  }

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
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0, top: 35),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new_sharp,
                        color: Colors.black,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                   //  Expanded(child: Container()), // Spacer
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
                        borderRadius:
                            BorderRadius.circular(10.0), // Rounded corners
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12), // Button padding
                    ),
                    onPressed: () async {
                      getCurrentLocation();
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
                child: TextField(
                  controller: address1,
                  decoration: const InputDecoration(
                      hintText: 'Address Line 1',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 16.0)),
                ),
              ),
              const SizedBox(height: 15),
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
                      contentPadding: EdgeInsets.only(left: 16.0)),
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
                      contentPadding: EdgeInsets.only(left: 16.0)),
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
                        bottom: MediaQuery.of(context).size.height *
                            0.20, // Adjust the bottom padding based on screen height
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 24, 118, 210),
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                          ),
                          onPressed: () {
                            _insertdata(
                                widget.fname,
                                widget.lname,
                                widget.phoneno,
                                lat,
                                long,);
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) =>  NavigationMenu()));
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

  void _clearAll() {
    widget.fname.text = '';
    widget.lname.text = '';
    widget.phoneno.text = '';
  }
}
