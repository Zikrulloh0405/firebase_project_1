// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDvL6kmsXpndwMQpniigjwB5CGDRgaV6KE',
    appId: '1:574752749748:web:73bc332dedeb0f7f44ffe1',
    messagingSenderId: '574752749748',
    projectId: 'flutter-first-firebase-p-12703',
    authDomain: 'flutter-first-firebase-p-12703.firebaseapp.com',
    storageBucket: 'flutter-first-firebase-p-12703.appspot.com',
    measurementId: 'G-M5LHZ1XL5Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCi7ea2tZcNMLQTn19TpcR4duovDyuf458',
    appId: '1:574752749748:android:608b650f3fbf1fb544ffe1',
    messagingSenderId: '574752749748',
    projectId: 'flutter-first-firebase-p-12703',
    storageBucket: 'flutter-first-firebase-p-12703.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBPyBuey4JCRQqi_Qly1QU4ykcYoayREng',
    appId: '1:574752749748:ios:be170e7b3ec3398c44ffe1',
    messagingSenderId: '574752749748',
    projectId: 'flutter-first-firebase-p-12703',
    storageBucket: 'flutter-first-firebase-p-12703.appspot.com',
    iosBundleId: 'com.example.firebaseProject1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBPyBuey4JCRQqi_Qly1QU4ykcYoayREng',
    appId: '1:574752749748:ios:8c9387abe0058ed844ffe1',
    messagingSenderId: '574752749748',
    projectId: 'flutter-first-firebase-p-12703',
    storageBucket: 'flutter-first-firebase-p-12703.appspot.com',
    iosBundleId: 'com.example.firebaseProject1.RunnerTests',
  );
}
