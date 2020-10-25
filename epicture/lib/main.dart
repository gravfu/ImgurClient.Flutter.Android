/*import 'pages/FrontPage.dart';
//import 'pages/ConnectImgur.dart';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Epicture',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Home(),
    );
  }
}
*/

import 'package:epicture/pages/ConnectImgur.dart';
import 'pages/NavBar.dart';
import 'package:flutter/material.dart';

void main() async {
  // Set default home.
  Widget _defaultHome = new ConnectApp();

  // Run app!
  runApp(new MaterialApp(
    title: 'App',
    home: _defaultHome,
    routes: <String, WidgetBuilder>{
      // Set routes for using the Navigator.
      '/home': (BuildContext context) => new NavBar(),
      '/login': (BuildContext context) => new ConnectApp()
    },
  ));
}
