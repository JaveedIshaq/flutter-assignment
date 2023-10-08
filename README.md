# Flutter Assignment

A Flutter project.

![A Flutter Resources App using Futter ](https://github.com/JaveedIshaq/flutter-assignment/blob/main/flutter_01.png?raw=true)

- [Download Android apk](https://github.com/JaveedIshaq/flutter-assignment/raw/main/flutter-assignment.apk)


Dating Cards data (Firebase Realtime Data + API)
There will be a list of users for the dating
Install and Run the firebase CLI
From any directory, run this command:
```dart pub global activate flutterfire_cli```
Then, at the root of your Flutter project directory, run this command:
```flutterfire configure --project=assinmentluvit```
This automatically registers your per-platform apps with Firebase and adds a lib/firebase_options.dart configuration file to your Flutter project.
For the flutterfire_cli, use below auth for connecting
Email : assignment.dev@hyperhire.in
PW : assignment!
Initialize firebase and add plugins
To initialize Firebase, call Firebase.initializeApp from the firebase_core package with the configuration from your new firebase_options.dart file:
import 'package:firebase_core/firebase_core.dart';
 import 'firebase_options.dart';
 // ...
 await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
 );
Realtime DB link
https://assinmentluvit-default-rtdb.asia-southeast1.firebasedatabase.app/
There is a possibility of the data is changing realtime, have to apply FIREBASE REALTIME DATABASE
You can use below API to change the Data in Firebase RealtimeDB.
POST https://frontassignment.hyperhire.in/change
Dating Cards Action
on tapping left-top side of the card, need to show previous image
on tapping right-top side of the card, need to show next image
on first image, have to show 101_Main Profile 01
on second image, have to show 102_Main Profile 02
on third image, have to show 103_Main Profile 03
on other images, have to show 103_Main Profile 03
Card is draggable to left and bottom side.
On dragged to left or bottom, the card should be disappeared
If there is no more cards to show, show 110_No Cards
Tip
DO NOT USE 90% / 80%. This is usually messing up the UI.


Make the UI exactly same as the image on the left
Consider all data is fixed with current system
You can use the Korean word copy & paste in here
Please generate apk for the assignment
After created the code, push it to github with your account with public, and share the url to us with your information - name / phone number / cv / github link / apk to suman@hyperhire.in with CC your recruiter
