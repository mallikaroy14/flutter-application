import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerScreen extends StatefulWidget {
  @override
  _PermissionHandlerScreenState createState() =>
      _PermissionHandlerScreenState();
}

class _PermissionHandlerScreenState extends State<PermissionHandlerScreen> {
  @override
  void initState() {
    super.initState();
    // permissionServiceCall();
  }

  Position? _currentPosition;
  String _currentAddress = "";

  // Future<void> permissionServiceCall() async {
  //   await permissionServices().then(
  //     (value) {
  //       if (value[Permission.location]!.isGranted) {
  //         // getCurrentLocation();
  //
  //         // Navigator.pushReplacement(
  //         //   context,
  //         //   MaterialPageRoute(builder: (context) => LoginScreen()),
  //         // );
  //       }
  //     },
  //   );
  // }

  // Future<Map<Permission, PermissionStatus>> permissionServices() async {
  //   Map<Permission, PermissionStatus> statuses =
  //       await [Permission.location, Permission.camera].request();
  //
  //   if (statuses[Permission.location]!.isPermanentlyDenied) {
  //     await openAppSettings().then(
  //       (value) async {
  //         if (value) {
  //           if (await Permission.location.status.isPermanentlyDenied == true &&
  //               await Permission.location.status.isGranted == false) {
  //             // openAppSettings();
  //             permissionServiceCall(); /* opens app settings until permission is granted */
  //           }
  //         }
  //       },
  //     );
  //   } else {
  //     if (statuses[Permission.location]!.isDenied) {
  //       permissionServiceCall();
  //     }
  //   }
  //   return statuses;
  // }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {

      openAppSettings();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // permissionServiceCall();
    return PopScope(
      // onWillPop: () {
      //   SystemNavigator.pop();
      // },
      child: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('LAT: ${_currentPosition?.latitude ?? ""}'),
            Text('LNG: ${_currentPosition?.longitude ?? ""}'),
            Row(
              children: [
                InkWell(
                    onTap: () {
                      _getCurrentPosition();
                    },
                    child:
                        Text("Click here to enable Enable Permission Screen ")),
                if (_currentAddress != null && _currentPosition != null)
                  Text(_currentAddress, style: TextStyle(fontSize: 18.0))
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // onWillPop: () {
      //   SystemNavigator.pop();
      // },
      child: Scaffold(
        body: Center(
          child: Text(
            "Splash Screen",
          ),
        ),
      ),
    );
  }
}
