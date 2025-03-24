import 'dart:convert';

import 'package:mydoon/models/place.dart';
import 'package:mydoon/Screens/map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:mydoon/register_Screen2.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({
    super.key,
    required this.onSelectLocation,
    required this.getCurrentLocationFunction,
  });

  final void Function(PlaceLocation location) onSelectLocation;
  final void Function() getCurrentLocationFunction;

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  @override
  void initState() {
    // TODO: implement initState
    _getCurrentLocation();
    super.initState();
  }

  String get LocationImage {
    if (_pickedLoaction == null) {
      return '';
    }
    final lat = _pickedLoaction!.latitude;
    final lng = _pickedLoaction!.longitude;
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$lng&key=AIzaSyARrnXZSYuwAjzpdaqP05oxvsYAgPEl3Jk';
  }

  PlaceLocation? _pickedLoaction;
  var _isGettingLocation = false;

  Future<void> _savePlace(double latitude, double longitude) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=AIzaSyARrnXZSYuwAjzpdaqP05oxvsYAgPEl3Jk');

    final response = await http.get(url);
    final resData = json.decode(response.body);
    print(resData);
    final address = resData['results'][0]['formatted_address'];
    setState(() {
      _pickedLoaction = PlaceLocation(
        latitude: latitude,
        longitude: longitude,
        address: address,
      );
      _isGettingLocation = false;
    });

    widget.onSelectLocation(_pickedLoaction!);
  }

  void _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      _isGettingLocation = true;
    });

    locationData = await location.getLocation();
    final lat = locationData.latitude;
    final lng = locationData.longitude;

    if (lat == null || lng == null) {
      return;
    }

    _savePlace(lat, lng);

    print(locationData.latitude);
    print(locationData.longitude);
  }

  void _selectOnMap() async {
    final pickedLocation = await Navigator.of(context).push<LatLng>(
      MaterialPageRoute(
        builder: (ctx) => MapScreen(),
      ),
    );

    if (pickedLocation == null) {
      return;
    }

    _savePlace(pickedLocation.latitude, pickedLocation.longitude);
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = Align(
      alignment: Alignment.center,
      child: Text(
        'No location selected ',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
    );

    if (_pickedLoaction != null) {
      previewContent = Image.network(
        LocationImage,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }

    if (_isGettingLocation) {
      previewContent = const SizedBox(
        width: 2,
        height: 2,
        child: LinearProgressIndicator(),
      );
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 46.0),
                  child: const Text(
                    'Address: ',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                Container(
                  padding: EdgeInsets.only(left: 32),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 24, 118, 210),
                      elevation: 2.0, // Button shadow
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // Rounded corners
                      ),
                    ),
                    onPressed: () async {
                      _getCurrentLocation();
                      widget.getCurrentLocationFunction();
                    },
                    child: const Text(
                      'Auto-Detect',
                      style: TextStyle(
                        color: Colors.white, // Text color
                        fontSize: 15, // Text size
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 140,
              width: 140,
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 215, 215, 215),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  previewContent,
                  if (_isGettingLocation)
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 215, 215, 215),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
