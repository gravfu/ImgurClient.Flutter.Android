EPICTURES
============
It's a project writen in dart using Flutter framework.


## Architecture:

We have a controller in epicture/lib/main.dart
This controler is use for:
- Login page (epicture/lib/pages/ConnectImgur.dart)
- Main App (epicture/lib/pages/NavBar.dart)

After login, the user is redirected in the Main App.

We have 5 widgets launched by the Navbar (on epicture/lib/widget):
- UploadCart.dart
- popularCardGallery.dart
- profileCardGallery.dart
- SearchCart.dart
- LikesCard.dart

All of those widgets use photoCard.dart. It is used for showing pictures from imgur.

## Links:
 + Epitech: http://epitech.fr/
 + Dart Code: https://flutter.dev/docs/deployment/obfuscate
 + Flutter: https://flutter.dev/

## Download:
 + https://github.com/EpitechIT2020/B-DEV-501-PAR-5-1-epicture-baptiste.godeau/actions

## Build:
```shell
cd epicture
flutter build apk --split-per-abi
```

## Authors:
Baptiste Godeau (baptiste.godeau@epitech.eu)
Vincent DOUROUX (vincent.douroux@epitech.eu)

The download page is not available due to Epitech Restiction. So you can use Github Action to see latests releases.
