/// Flutter code sample for FutureBuilder
// @dart = 2.9

// This sample shows a [FutureBuilder] that displays a loading spinner while it
// loads data. It displays a success icon and text if the [Future] completes
// with a result, or an error icon and text if the [Future] completes with an
// error. Assume the `_calculation` field is set by pressing a button elsewhere
// in the UI.

import 'package:flutter/material.dart';
import 'package:imgur/imgur.dart' as imgur;
import 'widget/ConnectImgur.dart';

/// This is the stateful widget that the main application instantiates.
class ScrollCardGallery extends StatefulWidget {
  ScrollCardGallery({Key key}) : super(key: key);

  @override
  _ScrollCardGallery createState() => _ScrollCardGallery();
}

/// This is the private State class that goes with ScrollCardGallery.
class _ScrollCardGallery extends State<ScrollCardGallery> {
  Widget build(BuildContext context) {
    return FutureBuilder<List<imgur.GalleryAlbumImage>>(
      future: clientID.gallery.list(section: imgur.Section.hot),
      builder: (BuildContext context,
          AsyncSnapshot<List<imgur.GalleryAlbumImage>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return new Text('loading...');
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              return ListView(
                scrollDirection: Axis.vertical,
                addAutomaticKeepAlives: true,
                children: <Widget>[
                  for (var i in snapshot.data)
                    if (i.images != null && i.images[0].type == "image/png")
                      SimplePhotoView(i.images[0])
                ],
              );
        }
      },
    );
  }
}

// ignore: must_be_immutable
class SimplePhotoView extends StatelessWidget {
  int index = 0;
  var imageNet;

  SimplePhotoView(var input) {
    this.imageNet = input;
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
                imageNet.link,
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
