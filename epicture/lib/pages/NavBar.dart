import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../widget/popularCardGallery.dart';
import '../widget/profileCardGallery.dart';
import '../widget/LikesCard.dart';
import 'ConnectImgur.dart';
import 'package:epicture/widget/UploadCart.dart';

/// This is the stateful widget that the main application instantiates.
class NavBar extends StatefulWidget {
  NavBar({Key key}) : super(key: key);

  @override
  _NavBar createState() => _NavBar();
}

// This is the private State class that goes with MyStatefulWidget.
class _NavBar extends State<NavBar> {
  int _selectedIndex = 0;

  var resp;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    PopularCardGallery(),
    Text(
      'Index 2: Searsh',
      style: optionStyle,
    ),
    UploadPage(),
    LikesCardGallery(),
    ProfileCardGallery(),
    if (!kReleaseMode) ConnectApp(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      debugPrint('Selected tab:');
      debugPrint(index.toString());
      debugPrint('Token is currently:');
      debugPrint(authTokenvar);
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud_upload),
            label: 'My Images',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'My Images',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'My Images',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.blueGrey,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}
