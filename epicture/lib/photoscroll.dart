//import 'dart:html';

//import 'package:photo_view/photo_view.dart';
//import 'package:photo_view/photo_view_gallery.dart';
//import 'dart:js';

import 'package:flutter/material.dart';

class ScrollCardGallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      addAutomaticKeepAlives: true,
      children: <Widget>[
        SimplePhotoView(0),
        SimplePhotoView(1),
        SimplePhotoView(2),
      ],
    );
  }
}

// ignore: must_be_immutable
class SimplePhotoView extends StatelessWidget {
  int index = 0;

  SimplePhotoView(int x) {
    this.index = x;
  }

  final imageNetList = [
    'https://i.imgur.com/RUPWLeZ.png',
    'https://i.imgur.com/gSPz2ZM.jpg',
    'https://i.imgur.com/zpcsV3b.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    //final screen = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Card(
          elevation: 5,
          margin: EdgeInsets.all(10),
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          borderOnForeground: true,
          child: Image.network(
            imageNetList[0],
            fit: BoxFit.fill,
          ),
        ),
        Card(
          elevation: 10,
          color: Colors.grey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_upward_rounded),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.arrow_downward_rounded),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.star_border_outlined),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/*
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
          _buildPhotoView(context),
        ],
      ),
    );
  }

  PhotoView _buildPhotoView(BuildContext context) {
    return PhotoView(
      controller: photoViewController,
      imageProvider: NetworkImage('https://i.imgur.com/RUPWLeZ.png'),
      minScale: PhotoViewComputedScale.contained * 0.8,
      maxScale: PhotoViewComputedScale.covered * 2,
      /*
      backgroundDecoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
      ),*/
      /*loadingChild: Center(
        child: CircularProgressIndicator(),
      ),*/
    );
  }

  @override
  void dispose() {
    super.dispose();
    photoViewController.dispose();
  }
}

class GalleryPage extends StatelessWidget {
  final imageList = [
    'https://imgur.com/gallery/XTuhCXC',
    'https://i.imgur.com/gSPz2ZM.jpg',
    'https://i.imgur.com/zpcsV3b.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PhotoView(
        imageProvider: NetworkImage(imageList[0]),
      ),
      /*
      child: PhotoViewGallery.builder(
        itemCount: 3,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(
              imageList[index],
            ),
            minScale: PhotoViewComputedScale.contained * 0.8,
            maxScale: PhotoViewComputedScale.covered * 2,
          );
        },
        scrollPhysics: BouncingScrollPhysics(),
        /*
            backgroundDecoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
            ),*/
        /*
            loadingChild: Center(
              child: CircularProgressIndicator(),
            ),*/
      ),*/
    );
  }
}
*/
