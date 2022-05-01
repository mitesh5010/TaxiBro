import 'package:flutter/material.dart';

import '../allscreen/mydrawer.dart';
import '../allscreen/splash_screen.dart';


class ProfileTabPage extends StatefulWidget {
  const ProfileTabPage({Key key}) : super(key: key);

  @override
  _ProfileTabPageState createState() => _ProfileTabPageState();
}



class _ProfileTabPageState extends State<ProfileTabPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text(
          "Sign Out",
        ),
        onPressed: ()
        {
          fAuth.signOut();
          Navigator.push(context, MaterialPageRoute(builder: (c)=> const MySplashScreen()));
        },
      ),
    );
  }
}
