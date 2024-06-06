import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationPermissionScreen extends StatefulWidget {
  const LocationPermissionScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LocationPermissionScreen();
}

class _LocationPermissionScreen extends State<LocationPermissionScreen> {
  final geolocator =
      Geolocator.getCurrentPosition(forceAndroidLocationManager: true);
  late Position _currentPosition ;
  String currentAddress = "";
  void getCurrentLocation() {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
      getAddressFromLatLng();
    }).catchError((e) {

    });
  }

  void getAddressFromLatLng() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];
      setState(() {
        currentAddress =
            "${place.thoroughfare},${place.subThoroughfare},${place.name}, ${place.subLocality}";
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(color: Theme.of(context).canvasColor),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.location_city),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: getCurrentLocation,
                        child: Text(
                          'Get Location',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      Text(currentAddress, style: const TextStyle(fontSize: 20.0)),
                    ],
                  ))
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
