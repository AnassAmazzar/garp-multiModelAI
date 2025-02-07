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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyD97oE7e0NBNR4IjX85GUpANe8eD02Y_nc',
    appId: '1:764154441284:web:861baeb0beb1af632a5611',
    messagingSenderId: '764154441284',
    projectId: 'my-grap-projectia',
    authDomain: 'my-grap-projectia.firebaseapp.com',
    databaseURL: 'https://my-grap-projectia-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'my-grap-projectia.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBbzKOG6Z_hwtgxCF8bM6DZDzMFudngJdA',
    appId: '1:764154441284:android:35b6651a8b4906042a5611',
    messagingSenderId: '764154441284',
    projectId: 'my-grap-projectia',
    databaseURL: 'https://my-grap-projectia-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'my-grap-projectia.firebasestorage.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD97oE7e0NBNR4IjX85GUpANe8eD02Y_nc',
    appId: '1:764154441284:web:c36a7742c08a231e2a5611',
    messagingSenderId: '764154441284',
    projectId: 'my-grap-projectia',
    authDomain: 'my-grap-projectia.firebaseapp.com',
    databaseURL: 'https://my-grap-projectia-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'my-grap-projectia.firebasestorage.app',
  );
}
