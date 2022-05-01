import 'package:cab_app/allscreen/loginscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/allscreen/mapscreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';


class MyDrawer extends StatelessWidget {
  String accountName, accountEmail,accountType;

  MyDrawer(void setState);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder(
          future: userDrawer(),
          builder: (context, snapshot) {
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(accountName),
                  accountEmail: Text(accountEmail),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("images/1.png"),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                  onTap: () {
                    Fluttertoast.showToast(msg: "This is My Profile");
                    Navigator.pushNamed(context, '/MyProfileScreen');
                  },
                  subtitle: Text('Personal'),
                  trailing: Icon(Icons.send),
                ),
                ListTile(
                  leading: Icon(Icons.car_rental_sharp),
                  title: Text('Book Ride'),
                  subtitle: Text('find nearest cab here'),
                  trailing: Icon(Icons.verified),
                  onTap: () {
                    Fluttertoast.showToast(msg: "Book Your cab");
                    Navigator.pushNamed(context, '/MyBookingScreen');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.domain_verification),
                  title: Text('Map'),
                  subtitle: Text('Find Cab Here'),
                  trailing: Icon(Icons.verified),
                  onTap: () {
                    Fluttertoast.showToast(msg: "This is My MapScreen");
                    Navigator.pushNamed(context, '/MyMapScreen');
                  },
                ),
                // ListTile(
                //   leading: Icon(Icons.add),
                //   title: Text('My Map1'),
                //   onTap: () {
                //     Fluttertoast.showToast(msg: "My Map1");
                //     Navigator.pushNamedAndRemoveUntil(
                //         context, '/MyMapScreen1', (route) => true);
                //   },
                // ),
                ListTile(
                  leading: Icon(Icons.message),
                  title: Text('Massage'),
                  onTap: () {
                    Fluttertoast.showToast(msg: "Message Pressed");
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/MyMassageScreen', (route) => true);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.account_balance_wallet_outlined),
                  title: Text('Wallet'),
                  onTap: () {
                    Fluttertoast.showToast(msg: "Wallet Pressed");
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/MyWalletScreen', (route) => true);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.help),
                  title: Text('Help'),
                  onTap: () {
                    Fluttertoast.showToast(msg: "Help Pressed");
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/MyHelpScreen', (route) => true);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.feedback_outlined),
                  title: Text('FeedBack'),
                  onTap: () {
                    Fluttertoast.showToast(msg: "My Balance Pressed");
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/MyFeedBackScreen', (route) => true);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.privacy_tip_outlined),
                  title: Text('Privacy Policy'),
                  onTap: () {
                    Fluttertoast.showToast(msg: "Privacy Policy Pressed");
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/MyPolicyScreen', (route) => true);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                  onTap: ()
                      {
                      fAuth.signOut();
                      Navigator.push(context, MaterialPageRoute(builder: (c)=> Login()));
                      },

                ),

              ],
            );
          }),
    );
  }

  Future userDrawer() async {
    var snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get();
    Map<String, dynamic> data = snapshot.data();
    accountEmail = data['email'];
    accountName = data['name'];
    accountType = data['role'];
  }
}

  // Future signOut() async{
  //   try{
  //     return await _.signOut();
  //   }catch(e){
  //     print(e.toString());
  //     return null;
  //   }
  // }



final FirebaseAuth fAuth = FirebaseAuth.instance;
User currentFirebaseUser;