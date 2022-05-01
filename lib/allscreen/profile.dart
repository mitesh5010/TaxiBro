import 'dart:developer';

import 'package:cab_app/allscreen/data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ProfilePage extends StatefulWidget {
  // const BookingPage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String accountName, accountEmail;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    // userDrawer();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),

          body: Container(
            height: double.maxFinite,
            width:  double.maxFinite,
            child: Stack(
              children: [
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.4,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      // gradient: LinearGradient(
                      //
                      //   begin: Alignment.topLeft,
                      //   end: Alignment.bottomRight,
                      // ),
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  bottom: 30,
                  right: 30,
                  left: 30,
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      height: double.maxFinite,
                      width: double.maxFinite,
                        padding: const EdgeInsets.only(top: 90) ,
                    child: Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff172B4D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            )
                          ), // RoundedRectangleBorder
                          onPressed: () {},
                          child: Container(
                            width: 55,
                            height: 35,
                            child: const Center(
                              child: Text(
                                "Edit",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ),
                         //text data
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: const [
                                  Text(
                                    "42",
                                    style: TextStyle(color: Color(0xff525f7f),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Total Rides",
                                  style: TextStyle(
                                    color: Color(0xff525f7f),
                                    fontSize: 18,
                                  ),),
                                ],
                              ),
                              Column(
                                children: const [
                                  Text(
                                    "12",
                                    style: TextStyle(color: Color(0xff525f7f),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Cancelled",
                                    style: TextStyle(
                                      color: Color(0xff525f7f),
                                      fontSize: 18,
                                    ),),
                                ],
                              ),
                              Column(
                                children: const [
                                  Text(
                                    "3.8",
                                    style: TextStyle(color: Color(0xff525f7f),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Rating",
                                    style: TextStyle(
                                      color: Color(0xff525f7f),
                                      fontSize: 18,
                                    ),),
                                ],
                              )

                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 30,
                            right: 30,
                            top: 10,
                            bottom: 10,
                          ),
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            Data.name,
                            //   accountName,
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                            Data.role
                            // accountEmail,
                        ),
                        const Padding(padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 10,
                          bottom: 10,
                        ),
                        child:Divider(
                          thickness: 0.8,
                          color: Colors.blueGrey,
                        ),
                        ),
                        ListTile(
                          leading: Icon(Icons.history),
                          title: Text('History'),
                          onTap: () {
                            Fluttertoast.showToast(msg: "History Pressed");
                            // Navigator.pushNamedAndRemoveUntil(
                            //     context, '/MyWalletScreen', (route) => true);
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.share_outlined),
                          title: Text('Share'),
                          onTap: () {
                            // Fluttertoast.showToast(msg: "Wallet Pressed");
                            // Navigator.pushNamedAndRemoveUntil(
                            //     context, '/MyWalletScreen', (route) => true);
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.logout),
                          title: Text('Logout'),
                          onTap: () {
                            Fluttertoast.showToast(msg: "Logout Pressed");
                            // print("$index "+menus[index]);
                            // Navigator.pushNamedAndRemoveUntil(
                            //     context, '/addcloth', (route) => true);
                          },
                        ),
                      ],
                    )
                    ),
                  ),
                ),
                 //image

                Positioned(
                  top: 75,
                  left: MediaQuery.of(context).size.width/2 -75,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(75),
                    child: Image.asset(
                      "images/1.png",
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  )
                )

              ],
            ),
          ),

      ),
    );
  }
  // Future userDrawer() async {
  //   var snapshot = await FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(FirebaseAuth.instance.currentUser.uid)
  //       .get();
  //   Map<String, dynamic> data = snapshot.data();
  //   accountEmail = data['email'];
  //   accountName = data['name'];
  //   log(data.toString());
  //   log("userDrawer End!!!!!!!"+accountName);
  //   log(FirebaseAuth.instance.currentUser.uid.toString());
  //
  // }
  }

class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path()
    ..lineTo(0,size.height)
    ..lineTo(size.width, size.height - 30)
    ..lineTo(size.width, 0)
    ..close();
    return path;
    throw UnimplementedError();
  }


  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;

}



