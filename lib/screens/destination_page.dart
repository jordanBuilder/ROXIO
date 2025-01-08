import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class DestinationPage extends StatefulWidget {
  const DestinationPage({super.key});

  @override
  State<DestinationPage> createState() => _DestinationPageState();
}

class _DestinationPageState extends State<DestinationPage> {
  // late String lat;
  // late String long;
  // late String locationMessage;

  GoogleMapController? mapController;
  LatLng _currentPosition = LatLng(0, 0);

  @override
  void initState() {
    super.initState;

    _getUserLocation();
    // _getCurrentLocation().then((value) {
    //   lat = '${value.latitude}';
    //   long = '${value.longitude}';
    //   // setState(() {
    //   //   locationMessage = 'Latitude: $lat , Longitude: $long';
    //   // });
    //   _liveLocation();
    //   _openMap(lat, long);
    // });
  }

  // Future<Position> _getCurrentLocation() async {
  //   bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return Future.error('Location services are disabled.');
  //   }
  //   LocationPermission permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Future.error('Location permissions are denied');
  //     }
  //   }
  //   if (permission == LocationPermission.deniedForever) {
  //     return Future.error(
  //         'Location permisssions are permanently denied, we cannot request permission');
  //   }
  //   return await Geolocator.getCurrentPosition();
  // }

  // //listen to location updates
  // void _liveLocation() {
  //   // LocationSettings locationSettings = const LocationSettings(
  //   //   accuracy: LocationAccuracy.high,
  //   //   distanceFilter: 100,
  //   // );

  //   Geolocator.getPositionStream(
  //     distanceFilter: 100,
  //     desiredAccuracy: LocationAccuracy.high,
  //   ).listen((Position position) {
  //     lat = position.longitude.toString();
  //     long = position.longitude.toString();

  //     setState(() {
  //       locationMessage = 'Latitude: $lat, Logitude: $long';
  //     });
  //   });
  // }

  // Future<void> _openMap(String lat, String long) async {
  //   String googleURL =
  //       'https://www.google.com/maps/search/?api=1&query=$lat,$long';
  //   // await canLaunchUrlString(googleURL)
  //   //     ? await launchURLString(googleURL)
  //   //     : throw 'Could not launch $googleURL';
  // }

  // Future<void> _getUserLocation() async {
  //   var status = await Permission.location.request();
  //   if (status.isGranted) {
  //     Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high,
  //     );

  //     setState(() {
  //       _currentPosition = LatLng(position.latitude, position.longitude);
  //     });

  //     mapController
  //         ?.animateCamera(CameraUpdate.newLatLngZoom(_currentPosition, 15));
  //   } else {
  //     print('Permission denied'); //add an alertBox later
  //   }
  // }

  Future<void> _getUserLocation() async {
  try {
    // Demande de permission
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      print("Permission refusée");
      return;
    }

    // Récupération de la position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
  } catch (e) {
    print('Erreur: $e');
  }
}

  void _onMapTapped(LatLng position) {
    setState(() {
      _currentPosition = position;
    });

    mapController?.animateCamera(CameraUpdate.newLatLng(position));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: _currentPosition, zoom: 15),
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        markers :{
          Marker(
            markerId: MarkerId('currentLocation'),
            position: _currentPosition,
            infoWindow: InfoWindow(title: 'My location'),
          ),
        },
        onTap: _onMapTapped,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
