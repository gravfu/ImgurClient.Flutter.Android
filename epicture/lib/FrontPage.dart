import 'package:flutter/material.dart';
import 'widget/NavBar.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';
  String clientID = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: NavBar(),
    );
  }
}
