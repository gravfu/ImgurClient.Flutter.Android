import 'package:flutter/material.dart';

class SimplePhotoView extends StatelessWidget {
  int index = 0;
  var imageNet;

  SimplePhotoView(var input) {
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
            children: [
              Image.network(
                imageNet.link,
                fit: BoxFit.fill,
              ),
              UpVoteOptions(imageNet),
            ],
          ),
        ),
      ],
    );
  }
}

class UpVoteOptions extends StatelessWidget {
  var imgurImage;
  int upvotes;
  int downvotes;
  bool _isupvoted = false;
  bool _isdownvoted = false;
  bool _isfav;

  UpVoteOptions(var input) {
    imgurImage = input;
    upvotes = imgurImage.ups;
    downvotes = imgurImage.downs;
    _isfav = imgurImage.favorite;
    if (upvotes == null) upvotes = 0;
    if (downvotes == null) downvotes = 0;
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
                    _isupvoted = true;
                    _isdownvoted = false;
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
                    _isupvoted = false;
                    _isdownvoted = true;
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
            IconButton(
              icon: Icon(
                Icons.star_border_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                _isfav = !_isfav;
                debugPrint('Starred');
              },
            ),
          ],
        ),
      ],
    );
  }
}
