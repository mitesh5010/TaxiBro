import 'dart:async';

// import 'package:drivers_app/authentication/login_screen.dart';
// import 'package:drivers_app/authentication/signup_screen.dart';
// import 'package:drivers_app/global/global.dart';
// import 'package:drivers_app/mainScreens/main_screen.dart';
import 'package:cab_app/allscreen/loginscreen.dart';
import 'package:cab_app/allscreen/mapscreen.dart';
import 'package:flutter/material.dart';


class MySplashScreen extends StatefulWidget
{
  const MySplashScreen({key}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}



class _MySplashScreenState extends State<MySplashScreen>
{

  startTimer()
  {
    Timer(const Duration(seconds: 3), () async
    {
      Navigator.push(context, MaterialPageRoute(builder: (c)=> Login()));
      //
      // var fAuth;
      // if(await fAuth.currentUser != null)
      // {
      //   // currentFirebaseUser = fAuth.currentUser;
      //   Navigator.push(context, MaterialPageRoute(builder: (c)=> MyHomePage()));
      // }
      // else
      // {
      //   Navigator.push(context, MaterialPageRoute(builder: (c)=> Login()));
      // }
    });
  }

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context)
  {
    return Material(
      child: Container(
        color: Colors.white12,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset("images/splash1.png"),

              const SizedBox(height: 10,),

              const Text(
                "TaxiBro : Book your Ride",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
