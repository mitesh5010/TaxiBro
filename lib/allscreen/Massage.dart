import 'package:flutter/material.dart';

class MassagePage extends StatefulWidget {
  // const BookingPage({Key? key}) : super(key: key);

  @override
  State<MassagePage> createState() => _MassagePageState();
}

class _MassagePageState extends State<MassagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Massage'),
      ),
    );
  }
}
