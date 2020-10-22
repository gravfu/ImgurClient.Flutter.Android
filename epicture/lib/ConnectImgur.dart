import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_web_auth/flutter_web_auth.dart';

void main() => runApp(ConnectApp());

class ConnectApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<ConnectApp> {
  String _status = '';
  String _clientID = '6acf662630ca71d';
  String _clientSecret = 'c9a7660d508e0722a99868baa06e4dedb4c91363';
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
        _status = 'Got result: $resul2';
        var uri = Uri.parse(resul2);
        uri.queryParameters.forEach((k, v) {
          _status += '\nkey: $k - value: $v';
        });
        _status +=
            '\n\nGot access token: ${uri.queryParameters['access_token']}';
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
