// import 'package:cab_app/allscreen/mydrawer.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:latlng/latlng.dart';
// import 'package:map/map.dart';
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   final controller = MapController(
//     location: LatLng(35.68, 51.41),
//   );
//
//   void _gotoDefault() {
//     controller.center = LatLng(35.68, 51.41);
//   }
//
//   void _onDoubleTap() {
//     controller.zoom += 0.5;
//   }
//
//   Offset _dragStart;
//   double _scaleStart = 1.0;
//   void _onScaleStart(ScaleStartDetails details) {
//     _dragStart = details.focalPoint;
//     _scaleStart = 1.0;
//   }
//
//   void _onScaleUpdate(ScaleUpdateDetails details) {
//     final scaleDiff = details.scale - _scaleStart;
//     _scaleStart = details.scale;
//
//     if (scaleDiff > 0) {
//       controller.zoom += 0.02;
//     } else if (scaleDiff < 0) {
//       controller.zoom -= 0.02;
//     } else {
//       final now = details.focalPoint;
//       final diff = now - _dragStart;
//       _dragStart = now;
//       controller.drag(diff.dx, diff.dy);
//     }
//   }
//
//   List<String> bottomMenus = [
//     "Mini",
//     "Sedan",
//     "Prime",
//     "Truck",
//   ];
//   List<IconData> bottomMenuIcons = [
//     Icons.car_rental,
//     Icons.local_taxi_rounded,
//     Icons.car_repair,
//     Icons.local_shipping_outlined,
//   ];
//   int selectedIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     //final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
//     //controller.tileSize = 256 / devicePixelRatio;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Location'),
//       ),
//       drawer: MyDrawer(setState),
//
//       body: GestureDetector(
//         onDoubleTap: _onDoubleTap,
//         onScaleStart: _onScaleStart,
//         onScaleUpdate: _onScaleUpdate,
//         onScaleEnd: (details) {
//           print(
//               "Location: ${controller.center.latitude}, ${controller.center.longitude}");
//         },
//         child: Stack(
//           children: [
//             Map(
//               controller: controller,
//               builder: (context, x, y, z) {
//                 final url =
//                     'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425';
//
//                 return CachedNetworkImage(
//                   imageUrl: url,
//                   fit: BoxFit.cover,
//                 );
//               },
//             ),
//             Center(
//               child: Icon(Icons.location_pin, color: Colors.black),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _gotoDefault,
//         tooltip: 'My Location',
//         child: Icon(Icons.my_location),
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:cab_app/allscreen/search_screen_from.dart';
import 'package:cab_app/allscreen/search_screen_to.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'mydrawer.dart';
// import 'package:users_app/authentication/login_screen.dart';
// import 'package:users_app/global/global.dart';


class MyHomePage extends StatefulWidget
{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}




class _MyHomePageState extends State<MyHomePage>
{
  final Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController newGoogleMapController;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  GlobalKey<ScaffoldState> sKey = GlobalKey<ScaffoldState>();
  double searchLocationContainerHeight = 220;

  Position userCurrentPosition;
  var geoLocator = Geolocator();

  LocationPermission _locationPermission;
  double bottomPaddingOfMap = 0;

  checkIfLocationPermissionAllowed() async
  {
    _locationPermission = await Geolocator.requestPermission();

    if(_locationPermission == LocationPermission.denied)
    {
      _locationPermission = await Geolocator.requestPermission();
    }
  }

  locateUserPosition() async
  {
    Position cPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    userCurrentPosition = cPosition;

    LatLng latLngPosition = LatLng(userCurrentPosition.latitude, userCurrentPosition.longitude);

    CameraPosition cameraPosition = CameraPosition(target: latLngPosition, zoom: 14);

    newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  @override
  void initState()
  {
    super.initState();

    checkIfLocationPermissionAllowed();
  }

  @override
  Widget build(BuildContext context)
  {
    // return Center(
    //   child: ElevatedButton(
    //     child: const Text(
    //       "Logout"
    //     ),
    //     onPressed: ()
    //     {
    //       fAuth.signOut();
    //       Navigator.push(context, MaterialPageRoute(builder: (c)=> LoginScreen()));
    //     },
    //   ),
    // );
    return Scaffold(
        appBar: AppBar(
        title: Text('My Location'),
      ),
      drawer: MyDrawer(setState),

        body: Stack(
        children: [
          GoogleMap(
            padding: EdgeInsets.only(bottom: bottomPaddingOfMap),
            mapType: MapType.normal,
            myLocationEnabled: true,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: true,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller)
            {
              _controllerGoogleMap.complete(controller);
              newGoogleMapController = controller;

              //for black theme google map
              // blackThemeGoogleMap();
              setState(() {
                bottomPaddingOfMap = 240;
              });

              locateUserPosition();
            },
          ),

          // Positioned(
          //   top: 30,
          //   left: 14,
          //   child: GestureDetector(
          //     onTap: ()
          //     {
          //       sKey.currentState.openDrawer();
          //     },
          //     child: const CircleAvatar(
          //       backgroundColor: Colors.grey,
          //       child: Icon(
          //         Icons.menu,
          //         color: Colors.black54,
          //       ),
          //     ),
          //   ),
          // ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedSize(
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 120),
              child: Container(
                height: searchLocationContainerHeight,
                decoration: const BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                  child: Column(
                    children: [
                      //from
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (c)=> SearchPlacesScreenFrom()));
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.add_location_alt_outlined, color: Colors.black,),
                            const SizedBox(width: 12.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "From",
                                  style: TextStyle(color: Colors.black, fontSize: 12),
                                ),
                                Text(
                                  "your current location",
                                  style: const TextStyle(color: Colors.black, fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10.0),

                      const Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.grey,
                      ),

                      const SizedBox(height: 16.0),

                      //to
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (c)=> SearchPlacesScreenTo()));
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.add_location_alt_outlined, color: Colors.black,),
                            const SizedBox(width: 12.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "To",
                                  style: TextStyle(color: Colors.black, fontSize: 12),
                                ),
                                Text(
                                  "Where to go?",
                                  style: const TextStyle(color: Colors.black, fontSize: 14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10.0),

                      const Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.grey,
                      ),

                      const SizedBox(height: 16.0),

                      ElevatedButton(
                        child: const Text(
                          "Request a Ride",
                        ),
                        onPressed: ()
                        {

                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
