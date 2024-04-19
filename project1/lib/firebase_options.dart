// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBQZ1TEPVSB_gRx86eyGuLWFB9IXigYs1w',
    appId: '1:468644802253:web:f5f73a86f569b579d40384',
    messagingSenderId: '468644802253',
    projectId: 'coloring-6c3ec',
    authDomain: 'coloring-6c3ec.firebaseapp.com',
    storageBucket: 'coloring-6c3ec.appspot.com',
    measurementId: 'G-XMTBJCSF5S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyApPLpWx32sh7yc4DVIgoYKRlT46awCCzM',
    appId: '1:468644802253:android:2ad62bb1adb95bf8d40384',
    messagingSenderId: '468644802253',
    projectId: 'coloring-6c3ec',
    storageBucket: 'coloring-6c3ec.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBcqiEI93NgqXb-eIR3DavdrKteCOqYtN4',
    appId: '1:468644802253:ios:f4642f54a140cfa4d40384',
    messagingSenderId: '468644802253',
    projectId: 'coloring-6c3ec',
    storageBucket: 'coloring-6c3ec.appspot.com',
    iosBundleId: 'com.example.project1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBcqiEI93NgqXb-eIR3DavdrKteCOqYtN4',
    appId: '1:468644802253:ios:f4642f54a140cfa4d40384',
    messagingSenderId: '468644802253',
    projectId: 'coloring-6c3ec',
    storageBucket: 'coloring-6c3ec.appspot.com',
    iosBundleId: 'com.example.project1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBQZ1TEPVSB_gRx86eyGuLWFB9IXigYs1w',
    appId: '1:468644802253:web:6c00e7cdc5eba1efd40384',
    messagingSenderId: '468644802253',
    projectId: 'coloring-6c3ec',
    authDomain: 'coloring-6c3ec.firebaseapp.com',
    storageBucket: 'coloring-6c3ec.appspot.com',
    measurementId: 'G-KM8J4GC0VB',
  );
}