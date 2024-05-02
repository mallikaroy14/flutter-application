import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationPermissionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _locationPermissionScreen();
}

class _locationPermissionScreen extends State<LocationPermissionScreen> {
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
      print(e);
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
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.location_city),
                  SizedBox(
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
                      if (_currentPosition != null && currentAddress != null)
                        Text(currentAddress, style: TextStyle(fontSize: 20.0))
                      else
                          Text("Coudn'nt fetch the location"),
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
