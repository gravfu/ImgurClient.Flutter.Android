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
            imagePath: pickedFile.path,
            title: 'Blabla',
            description: 'A description');
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.grey[850],
      body: Center(
        child: _image == null ? Text('No image selected.') : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
