import 'package:photo_view/photo_view.dart';
import 'package:flutter/material.dart';

class ControllerPhotoViewPage extends StatefulWidget {
  @override
  _ControllerPhotoViewState createState() => _ControllerPhotoViewState();
}

class _ControllerPhotoViewState extends State<ControllerPhotoViewPage> {
  PhotoViewController photoViewController;

  @override
  void initState() {
    super.initState();
    photoViewController = PhotoViewController();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          //_buildScaleInfo(),
          //_buildResetScaleButton(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    photoViewController.dispose();
  }
}
