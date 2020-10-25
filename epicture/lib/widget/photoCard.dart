import 'package:flutter/material.dart';
import 'package:imgur/imgur.dart' as imgur;

// ignore: must_be_immutable
class SimplePhotoViewProfile extends StatelessWidget {
  int index = 0;
  var imageNet;

  SimplePhotoViewProfile(var input) {
    this.imageNet = input;
    debugPrint("Loaded one Image");
  }

  @override
  Widget build(BuildContext context) {
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
            children: <Widget>[
              Text(imageNet.title),
              Image.network(
                imageNet.link,
                fit: BoxFit.fill,
              ),
              UpVoteOptionsNoLikes(imageNet)
            ],
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class SimplePhotoViewAlbumGalleryImage extends StatelessWidget {
  int index = 0;
  imgur.GalleryAlbumImage imageNet;

  SimplePhotoViewAlbumGalleryImage(var input) {
    this.imageNet = input;
    debugPrint("Loaded one Image");
  }

  @override
  Widget build(BuildContext context) {
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
            children: <Widget>[
              Text(
                imageNet.title,
                style: TextStyle(fontFamily: 'Ubuntu', color: Colors.white),
              ),
              //Pad
              Image.network(
                imageNet.images[0].link,
                fit: BoxFit.fill,
              ),
              UpVoteOptionsLikes(imageNet),
            ],
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class UpVoteOptionsLikes extends StatelessWidget {
  var imgurImage;
  int upvotes;
  int downvotes;
  int views;
  //bool _isupvoted = false;
  //bool _isdownvoted = false;
  // ignore: unused_field
  bool _isfav;

  UpVoteOptionsLikes(var input) {
    this.imgurImage = input;
    this.upvotes = input.ups;
    this.downvotes = input.downs;
    this._isfav = imgurImage.favorite;
    if (upvotes == null) upvotes = 0;
    if (downvotes == null) downvotes = 0;
    debugPrint('Image upvotes:');
    debugPrint(upvotes.toString());
  }

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
                  onPressed: () {
                    //_isupvoted = true;
                    //_isdownvoted = false;
                    debugPrint('Upvoted');
                  },
                ),
                Text(
                  upvotes.toString(),
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
                    //_isupvoted = false;
                    //_isdownvoted = true;
                    debugPrint('Downvoted');
                  },
                ),
                Text(
                  downvotes.toString(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            FavButton(),
          ],
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class UpVoteOptionsNoLikes extends StatelessWidget {
  var imgurImage;

  int _views;
  String viewsString;
  // ignore: unused_field
  bool _isfav;

  UpVoteOptionsNoLikes(var input) {
    imgurImage = input;
    _views = imgurImage.views;
    _isfav = imgurImage.favorite;
    debugPrint('Image views:');
    debugPrint(_views.toString());
    viewsString = _views.toString();
    if (_views > 999) {
      viewsString = viewsString.substring(0, viewsString.length - 3);
      viewsString += 'k';
    }
  }

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
                    Icons.remove_red_eye_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    debugPrint('Views button');
                  },
                ),
                Text(
                  viewsString,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            FavButton(),
          ],
        ),
      ],
    );
  }
}

class FavButton extends StatefulWidget {
  FavButton({Key key}) : super(key: key);
  @override
  FavButtonState createState() => FavButtonState();
}

class FavButtonState extends State<StatefulWidget> {
  Color _iconColor = Colors.white;
  bool _isfav = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.star, color: _iconColor),
      onPressed: () {
        _isfav = !_isfav;
        if (_isfav)
          setState(() {
            _iconColor = Colors.yellow;
          });
        if (!_isfav)
          setState(() {
            _iconColor = Colors.white;
          });
      },
    );
  }
}
