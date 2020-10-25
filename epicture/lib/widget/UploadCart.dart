import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../pages/ConnectImgur.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPage createState() => _UploadPage();
}

class _UploadPage extends State<UploadPage> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        clientID.image.uploadImage(
            imagePath: pickedFile.path, title: '', description: '');
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload'),
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.grey[850],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Center(
            child: _image == null
                ? Text('No image selected.')
                : Text('Upload Successful',
                    style:
                        TextStyle(fontFamily: 'Ubuntu', color: Colors.green)),
          ),
          MyCustomForm(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Controller1 = TextEditingController();
    final Controller2 = TextEditingController();

    @override
    void dispose() {
      Controller1.dispose();
      Controller2.dispose();
      super.dispose();
    }

    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: Controller1,
            validator: (value) {
              if (value.isEmpty) {
                return 'No Title';
              }
              return null;
            },
          ),
          TextFormField(
            style: TextStyle(color: Colors.red),
            controller: Controller2,
            validator: (value) {
              if (value.isEmpty) {
                return 'No Description';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: FlatButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Uploading...')));
                }
              },
              color: Colors.white60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.all(4.0)),
                  Text('Upload', style: TextStyle(fontFamily: 'Ubuntu'))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
