import 'package:cab_app/allscreen/Massage.dart';
import 'package:cab_app/allscreen/bookcab.dart';
import 'package:cab_app/allscreen/feedback.dart';
import 'package:cab_app/allscreen/help.dart';
import 'package:cab_app/allscreen/mapscreen.dart';
import 'package:cab_app/allscreen/privecypolicy.dart';
import 'package:cab_app/allscreen/profile.dart';
import 'package:cab_app/allscreen/splash_screen.dart';
import 'package:cab_app/allscreen/wallet.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import 'allscreen/loginscreen.dart';
import 'allscreen/registerationscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
      // MaterialApp(
      //   // home: HomePage(),
      //   theme: ThemeData(
      //     primaryColor: Colors.purple,
      //   ),
      //   initialRoute: '/',
      //   routes: {
      //     '/': (context) => MyMapScreen(),
      //     '/MyMapScreen': (context) => MyMapScreen(),
      //     // '/MyMapScreen1': (context) => MyMap1(),
      //     //'/RegisterationScreen.idScreen': (context) => RegisterationScreen(),
      //     //'/LoginScreen.idScreen': (context) => LoginScreen(),
      //     //'/MainScreen.idScreen': (context) => MainScreen(),
      //   },
      //   debugShowCheckedModeBanner: false,
      // ),
      mainscreen());
}

class mainscreen extends StatefulWidget {
  @override
  _mainscreenState createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text("online booking cab"),
      //   ),
      //   // drawer: MyDrawer(),
      // ),

      initialRoute: '/',
      routes: {
        '/': (c) => MySplashScreen(),
        // '/': (c) => CarInfoScreen(),
        '/MyMapScreen': (context) => MyHomePage(),
        // '/MyMapScreen1': (context) => MyMap1(),
        '/RegisterationScreen.idScreen': (context) => Register(),
        // '/LoginScreen.idScreen': (context) => Login(),
        '/mainscreen': (context) => mainscreen(),
        '/MyProfileScreen': (context) => ProfilePage(),
        '/MyBookingScreen': (context) => BookingPage(),
        '/MyMassageScreen': (context) => MassagePage(),
        '/MyWalletScreen': (context) => WalletPage(),
        '/MyHelpScreen': (context) => HelpPage(),
        '/MyFeedBackScreen': (context) => FeedBackPage(),
        '/MyPolicyScreen': (context) => PolicyPage(),

      },
      debugShowCheckedModeBanner: false,
    );
  }
}
