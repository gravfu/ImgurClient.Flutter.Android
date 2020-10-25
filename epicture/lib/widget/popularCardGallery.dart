/// Flutter code sample for FutureBuilder
// @dart = 2.9

// This sample shows a [FutureBuilder] that displays a loading spinner while it
// loads data. It displays a success icon and text if the [Future] completes
// with a result, or an error icon and text if the [Future] completes with an
// error. Assume the `_calculation` field is set by pressing a button elsewhere
// in the UI.

import 'package:epicture/widget/photoCard.dart';
import 'package:flutter/material.dart';
import 'package:imgur/imgur.dart' as imgur;
import '../pages/ConnectImgur.dart';

/// This is the stateful widget that the main application instantiates.
class PopularCardGallery extends StatefulWidget {
  PopularCardGallery({Key key}) : super(key: key);

  @override
  _PopularCardGallery createState() => _PopularCardGallery();
}

/// This is the private State class that goes with ScrollCardGallery.
class _PopularCardGallery extends State<PopularCardGallery> {
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
