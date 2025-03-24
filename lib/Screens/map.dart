import 'package:mydoon/models/place.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.location = const PlaceLocation(
      latitude: 37.422,
      longitude: -122.084,
      address: '',
    ),
    this.isSelecting = true,
  });

  final PlaceLocation location;
  final bool isSelecting;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // void _getCurrentLocation() async {
  //   Location location = Location();
  //
  //   bool serviceEnabled;
  //   PermissionStatus permissionGranted;
  //   LocationData locationData;
  //
  //   serviceEnabled = await location.serviceEnabled();
  //   if (!serviceEnabled) {
  //     serviceEnabled = await location.requestService();
  //     if (!serviceEnabled) {
  //       return;
  //     }
  //   }
  //
  //   permissionGranted = await location.hasPermission();
  //   if (permissionGranted == PermissionStatus.denied) {
  //     permissionGranted = await location.requestPermission();
  //     if (permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }
  //
  //   locationData = await location.getLocation();
  //   final lat = locationData.latitude;
  //   final lng = locationData.longitude;
  //
  //   if (lat == null || lng == null) {
  //     return;
  //   }
  //   print(locationData.latitude);
  //   print(locationData.longitude);
  // }

  LatLng? _pickedLocation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.isSelecting ? 'pick your location' : 'your location'),
        actions: [
          if (widget.isSelecting)
            IconButton(
              onPressed: () {
                Navigator.of(context).pop(
                  _pickedLocation,
                );
              },
              icon: Icon(Icons.save),
            ),
        ],
      ),
      body: GoogleMap(
        onCameraMove: (positon) {
          setState(() {
            _pickedLocation = positon.target;
          });
        },
        // onTap: !widget.isSelecting?null:(position) {
        //   setState(() {
        //     _pickedLocation = position;
        //   });
        // },
        initialCameraPosition: CameraPosition(
            target: LatLng(
              widget.location.latitude,
              widget.location.longitude,
            ),
            zoom: 16),
        markers: (_pickedLocation == null && widget.isSelecting)
            ? {}
            : {
                Marker(
                  markerId: MarkerId('m1'),
                  position: _pickedLocation ??
                      LatLng(
                        widget.location.latitude,
                        widget.location.longitude,
                      ),
                ),
              },
      ),
    );
  }
}
