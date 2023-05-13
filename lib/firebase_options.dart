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
    apiKey: 'AIzaSyCyOvD_sVMnVIOkXqOXI-wr8hbCBBRwX1U',
    appId: '1:451683984755:web:b1e09a8d38749cdd68d106',
    messagingSenderId: '451683984755',
    projectId: 'boosky-50cf5',
    authDomain: 'boosky-50cf5.firebaseapp.com',
    storageBucket: 'boosky-50cf5.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBN_wQfVERmDXAoJJ6ItMn5gEPUKBlpXvE',
    appId: '1:451683984755:android:514c5d77b24b117168d106',
    messagingSenderId: '451683984755',
    projectId: 'boosky-50cf5',
    storageBucket: 'boosky-50cf5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAUyjoEeBIdItFkbGKtvIkTZmA6PHQFCvQ',
    appId: '1:451683984755:ios:bb925ef7a3961fe268d106',
    messagingSenderId: '451683984755',
    projectId: 'boosky-50cf5',
    storageBucket: 'boosky-50cf5.appspot.com',
    iosClientId: '451683984755-ingkvibh94ndptgih5h5mkd9079tpgb5.apps.googleusercontent.com',
    iosBundleId: 'com.example.boosky',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAUyjoEeBIdItFkbGKtvIkTZmA6PHQFCvQ',
    appId: '1:451683984755:ios:bb925ef7a3961fe268d106',
    messagingSenderId: '451683984755',
    projectId: 'boosky-50cf5',
    storageBucket: 'boosky-50cf5.appspot.com',
    iosClientId: '451683984755-ingkvibh94ndptgih5h5mkd9079tpgb5.apps.googleusercontent.com',
    iosBundleId: 'com.example.boosky',
  );
}