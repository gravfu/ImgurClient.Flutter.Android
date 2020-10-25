import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_web_auth/flutter_web_auth.dart';

import 'package:imgur/imgur.dart' as imgur;

String authTokenvar = '';
bool isAuthentified = false;
imgur.Imgur clientID;

class ConnectApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<ConnectApp> {
  String _status = '';
  String _clientID = '6acf662630ca71d';
  final _callbackUrlScheme = 'com.example.epicture://success';

  @override
  void initState() {
    super.initState();
  }

  void authenticate() async {
    final url = Uri.https('api.imgur.com', '/oauth2/authorize', {
      'response_type': 'token',
      'client_id': _clientID,
      'redirect_uri': _callbackUrlScheme,
    });
    try {
      final result = await FlutterWebAuth.authenticate(
          url: url.toString(), callbackUrlScheme: 'com.example.epicture');
      setState(() {
        var resul2 = result.replaceAll('#', '?');
        var uri = Uri.parse(resul2);
        authTokenvar = uri.queryParameters['access_token'];
        if ((uri.queryParameters['access_token'].isNotEmpty)) {
          isAuthentified = true;
          clientID = imgur.Imgur(imgur.Authentication.fromToken(authTokenvar));
          if (kReleaseMode) Navigator.of(context).pushReplacementNamed('/home');
        }
      });
    } on PlatformException catch (e) {
      setState(() {
        _status = 'Got error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Status: $_status\n'),
            const SizedBox(height: 80),
            RaisedButton(
              child: Text('Authenticate'),
              onPressed: () {
                this.authenticate();
              },
            ),
          ],
        ),
      ),
    );
  }
}
