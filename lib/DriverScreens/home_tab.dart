import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../allscreen/mydrawer.dart';


class HomeTabPage extends StatefulWidget {
  const HomeTabPage({Key key}) : super(key: key);

  @override
  _HomeTabPageState createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {

  final Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController newGoogleMapController;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Position driverCurrentPosition;
  var geoLocator = Geolocator();
  LocationPermission _locationPermission;

  String statusText = "Now Offline";
  Color buttonColor = Colors.grey;
  bool isDriverActive = false;


  checkIfLocationPermissionAllowed() async
  {
    _locationPermission = await Geolocator.requestPermission();

    if(_locationPermission == LocationPermission.denied)
    {
      _locationPermission = await Geolocator.requestPermission();
    }
  }

  locateDriverPosition() async
  {
    Position cPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    driverCurrentPosition = cPosition;

    LatLng latLngPosition = LatLng(driverCurrentPosition.latitude, driverCurrentPosition.longitude);

    CameraPosition cameraPosition = CameraPosition(target: latLngPosition, zoom: 14);

    newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    // String humanReadableAddress = await AssistantMethods.searchAddressForGeographicCoOrdinates(driverCurrentPosition!, context);
    // print("this is your address = " + humanReadableAddress);
  }


  // static const CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          //Google map code
          GoogleMap(
            // padding: EdgeInsets.only(bottom: bottomPaddingOfMap),
            mapType: MapType.normal,
            myLocationEnabled: true,
            // zoomGesturesEnabled: true,
            // zoomControlsEnabled: true,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller)
            {
                _controllerGoogleMap.complete(controller);
                newGoogleMapController = controller;

                  //for black theme google map
              // blackThemeGoogleMap();


            locateDriverPosition();
            },
        ),

          //offline online ui driver
          Positioned(
            top: statusText != "Now Online"
                ? MediaQuery.of(context).size.height * 0.46
                : 25,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: ()
                  {
                    if(isDriverActive != true) //offline
                        {
                      // driverIsOnlineNow();
                      // updateDriversLocationAtRealTime();

                      setState(() {
                        statusText = "Now Online";
                        isDriverActive = true;
                        buttonColor = Colors.transparent;
                      });

                      //display Toast
                      Fluttertoast.showToast(msg: "you are Online Now");
                    }
                    else //online
                        {
                      // driverIsOfflineNow();

                      setState(() {
                        statusText = "Now Offline";
                        isDriverActive = false;
                        buttonColor = Colors.black38;
                      });

                      //display Toast
                      Fluttertoast.showToast(msg: "you are Offline Now");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: buttonColor,
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                  ),
                  child: statusText != "Now Online"
                      ? Text(
                    statusText,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                      : const Icon(
                    Icons.phonelink_ring,
                    color: Colors.black,
                    size: 26,
                  ),
                ),
              ],
            ),
          ),
      ]
    );
  }
}

// driverIsOnlineNow() async
// {
//   // Position pos = await Geolocator.getCurrentPosition(
//   //   desiredAccuracy: LocationAccuracy.high,
//   // );
//   // driverCurrentPosition = pos;
//
//   Geofire.initialize("activeDrivers");
//
//   Geofire.setLocation(
//       currentFirebaseUser!.uid,
//       driverCurrentPosition!.latitude,
//       driverCurrentPosition!.longitude
//   );
//
//   DatabaseReference ref = FirebaseDatabase.instance.ref()
//       .child("drivers")
//       .child(currentFirebaseUser!.uid)
//       .child("newRideStatus");
//
//   ref.set("idle"); //searching for ride request
//   ref.onValue.listen((event) { });
// }

// updateDriversLocationAtRealTime()
// {
//   streamSubscriptionPosition = Geolocator.getPositionStream()
//       .listen((Position position)
//   {
//     driverCurrentPosition = position;
//
//     if(isDriverActive == true)
//     {
//       Geofire.setLocation(
//           currentFirebaseUser!.uid,
//           driverCurrentPosition!.latitude,
//           driverCurrentPosition!.longitude
//       );
//     }
//
//     LatLng latLng = LatLng(
//       driverCurrentPosition!.latitude,
//       driverCurrentPosition!.longitude,
//     );
//
//     newGoogleMapController!.animateCamera(CameraUpdate.newLatLng(latLng));
//   });
// }

// driverIsOfflineNow()
// {
//   Geofire.removeLocation(currentFirebaseUser.uid);
//
//   DatabaseReference? ref = FirebaseDatabase.instance.ref()
//       .child("drivers")
//       .child(currentFirebaseUser!.uid)
//       .child("newRideStatus");
//   ref.onDisconnect();
//   ref.remove();
//   ref = null;
//
//   Future.delayed(const Duration(milliseconds: 2000), ()
//   {
//     //SystemChannels.platform.invokeMethod("SystemNavigator.pop");
//     SystemNavigator.pop();
//   });
// }

