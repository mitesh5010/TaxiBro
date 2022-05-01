import 'package:cab_app/allscreen/Massage.dart';
import 'package:cab_app/allscreen/bookcab.dart';
import 'package:cab_app/allscreen/feedback.dart';
import 'package:cab_app/allscreen/help.dart';
import 'package:cab_app/allscreen/mydrawer.dart';
import 'package:cab_app/allscreen/privecypolicy.dart';
import 'package:cab_app/allscreen/wallet.dart';
import 'package:flutter/material.dart';

class mainscreen extends StatefulWidget {
  @override
  _mainscreenState createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("TaXiBRo"),
      ),

      drawer: MyDrawer(
        initState()
      ),
      body: Center(
        //box
        child: Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(5),
          // color: Colors.blue,
          width: 100,
          height: 100,
          clipBehavior: Clip.antiAlias,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blue,
              // shape: BoxShape.circle,
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(colors: [
                Colors.blue,
                Colors.blue[300],
                Colors.purpleAccent,
                Colors.purpleAccent[200],
              ]),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5,
                )
              ]),
          child: Text(
            "MITESH",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          // child: Text("Hii mitesh "),
        ),
      ),
    );
  }
}
