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
    apiKey: 'AIzaSyDA-QHoiy9G6cJdml00fagC0jnh3KFXN-Y',
    appId: '1:741669164619:web:f47b8a4a1de6b1bb6a5fce',
    messagingSenderId: '741669164619',
    projectId: 'sfac-test-46ab9',
    authDomain: 'sfac-test-46ab9.firebaseapp.com',
    storageBucket: 'sfac-test-46ab9.appspot.com',
    measurementId: 'G-V9YMQ0R5PH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAm8wCzSETCzYdfo-tlOi9esPJq7cYEE0Q',
    appId: '1:741669164619:android:6e312cbda02bf2d26a5fce',
    messagingSenderId: '741669164619',
    projectId: 'sfac-test-46ab9',
    storageBucket: 'sfac-test-46ab9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDtgOoxipFkNj9OVS88eZuQU1rslNAXYEM',
    appId: '1:741669164619:ios:78af0eda0d6bba016a5fce',
    messagingSenderId: '741669164619',
    projectId: 'sfac-test-46ab9',
    storageBucket: 'sfac-test-46ab9.appspot.com',
    iosBundleId: 'com.example.flutterClass',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDtgOoxipFkNj9OVS88eZuQU1rslNAXYEM',
    appId: '1:741669164619:ios:94f930bcceb58b086a5fce',
    messagingSenderId: '741669164619',
    projectId: 'sfac-test-46ab9',
    storageBucket: 'sfac-test-46ab9.appspot.com',
    iosBundleId: 'com.example.flutterClass.RunnerTests',
  );
}