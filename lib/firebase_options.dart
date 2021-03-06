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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBCv5qnqM2MM4oJhBQD3Y7_ajM3NRTycDk',
    appId: '1:341470184842:web:e5f5a9b8b74fc5dcfd7473',
    messagingSenderId: '341470184842',
    projectId: 'fieldtrip-86fab',
    authDomain: 'fieldtrip-86fab.firebaseapp.com',
    storageBucket: 'fieldtrip-86fab.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBJI14075-2GkmkHeKGATAHje5ajoPlGgA',
    appId: '1:341470184842:android:7835c89b0dfeaadafd7473',
    messagingSenderId: '341470184842',
    projectId: 'fieldtrip-86fab',
    storageBucket: 'fieldtrip-86fab.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAyI_WJWpWdyniUHgLUxAtS48wr8UrEzfg',
    appId: '1:341470184842:ios:b1b8cc198a9cc2b5fd7473',
    messagingSenderId: '341470184842',
    projectId: 'fieldtrip-86fab',
    storageBucket: 'fieldtrip-86fab.appspot.com',
    androidClientId: '341470184842-5fs7k4b4685ucup20cha7acbgpr61iu9.apps.googleusercontent.com',
    iosClientId: '341470184842-baet7v22h78teedgsa8ukd674et82bin.apps.googleusercontent.com',
    iosBundleId: 'com.example.mfieldtrip',
  );
}
