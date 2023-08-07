import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  Location? _pickedLocation;

  var _isGettingLocation = false;

  void _getCurrentLocation() async {
    setState(() {
      _isGettingLocation = true;
    });

    Location location = Location();

    setState(() {
      _isGettingLocation = false;
    });

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

    locationData = await location.getLocation();

    final lat = locationData.latitude;
    final lng = locationData.longitude;
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=AIzaSyBEAksBBSAz5uQWsmlmoBQkVz5YfrKTxhs');
    final response = await http.get(url);
    final resData = json.decode(response.body);
    final address = resData['results'][0]['formatted_address'];
    print('address ' + address);
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = Text(
      'No location chosen',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
    );

    if (_isGettingLocation) {
      previewContent = const CircularProgressIndicator();
    }

    return Column(children: [
      Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          ),
        ),
        height: 170,
        width: double.infinity,
        alignment: Alignment.center,
        child: previewContent,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton.icon(
            onPressed: _getCurrentLocation,
            icon: const Icon(Icons.location_on),
            label: const Text('Get current location'),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.map),
            label: const Text('Select on map'),
          ),
        ],
      ),
    ]);
  }
}