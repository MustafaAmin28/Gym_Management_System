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
    apiKey: 'AIzaSyAClNgFnzDXW5P2B8pUo8GOIDiTVylxNW8',
    appId: '1:137885211704:web:12e653afd660d2ff989acd',
    messagingSenderId: '137885211704',
    projectId: 'gym-app-2f3bd',
    authDomain: 'gym-app-2f3bd.firebaseapp.com',
    storageBucket: 'gym-app-2f3bd.appspot.com',
    measurementId: 'G-TDKC25QXZT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCA_qobWfafzXTDWyx5sGjk47CstZo7bWo',
    appId: '1:137885211704:android:960c6b2fae34d2c0989acd',
    messagingSenderId: '137885211704',
    projectId: 'gym-app-2f3bd',
    storageBucket: 'gym-app-2f3bd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD5CtbO_n-gwXBxDJRRmCTpJ4TN-Di602M',
    appId: '1:137885211704:ios:6aecbe701d3f14bc989acd',
    messagingSenderId: '137885211704',
    projectId: 'gym-app-2f3bd',
    storageBucket: 'gym-app-2f3bd.appspot.com',
    iosClientId: '137885211704-nduhf7ejld1j9a777aqa482lt6765us5.apps.googleusercontent.com',
    iosBundleId: 'com.example.gymGraduationApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD5CtbO_n-gwXBxDJRRmCTpJ4TN-Di602M',
    appId: '1:137885211704:ios:6aecbe701d3f14bc989acd',
    messagingSenderId: '137885211704',
    projectId: 'gym-app-2f3bd',
    storageBucket: 'gym-app-2f3bd.appspot.com',
    iosClientId: '137885211704-nduhf7ejld1j9a777aqa482lt6765us5.apps.googleusercontent.com',
    iosBundleId: 'com.example.gymGraduationApp',
  );
}
