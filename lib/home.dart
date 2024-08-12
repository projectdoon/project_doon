import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final _NameController = TextEditingController();

  late String latitude ;
  late String longitude ;

  @override
  void dispose() {
    _NameController.dispose();
    super.dispose();
  }

  getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      print("Location denied");
      LocationPermission ask = await Geolocator.requestPermission();
    }

    else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      latitude=currentPosition.latitude.toString();
      longitude=currentPosition.longitude.toString();
      
      print(latitude);
      print(longitude);
      setState(() {
        LocationMessage="latitude = $latitude  longitude = $longitude";
      });

    }
  }

  String LocationMessage ='current location is';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register yourself'),
      ),
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

              const SizedBox(height: 20,),

              Text(LocationMessage),



              ElevatedButton(
                onPressed: () {
                  print('hii');
                  getCurrentLocation();

                },
                child: const Text('detect my location'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
