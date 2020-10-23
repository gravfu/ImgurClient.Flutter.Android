//mport 'package:imgur/imgur.dart' as imgur;
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ScrollCardGallery extends StatelessWidget {
  var imageNetList;

  ScrollCardGallery(var input) {
    this.imageNetList = input;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      addAutomaticKeepAlives: true,
      children: <Widget>[
        for (var i in imageNetList) SimplePhotoView(i),
      ],
    );
  }
}

// ignore: must_be_immutable
class SimplePhotoView extends StatelessWidget {
  int index = 0;
  var imageNetURL;

  SimplePhotoView(var input) {
    this.imageNetURL = input;
    debugPrint("Loaded one Image");
  }

  @override
  Widget build(BuildContext context) {
    //final screen = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Card(
          color: Colors.blueGrey[800],
          elevation: 5,
          margin: EdgeInsets.all(10),
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          borderOnForeground: true,
          child: Column(
            children: [
              Image.network(
                imageNetURL,
                fit: BoxFit.fill,
              ),
              UpVoteOptions(),
            ],
          ),
        ),
      ],
    );
  }
}

class UpVoteOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_upward_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                Text(
                  "45",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_downward_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    debugPrint('Hello');
                  },
                ),
                Text(
                  "12",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            IconButton(
              icon: Icon(
                Icons.star_border_outlined,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
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
