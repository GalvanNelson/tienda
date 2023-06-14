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
    apiKey: 'AIzaSyCiyu_rN-cKGO7zydGXZKk4DgtCF9oZPqA',
    appId: '1:274685203608:web:2863e7e5e7f1d22f932ced',
    messagingSenderId: '274685203608',
    projectId: 'tienda-78a0e',
    authDomain: 'tienda-78a0e.firebaseapp.com',
    storageBucket: 'tienda-78a0e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAk0emzfZe_SBLtGW4QlmHU8Y3CCHyow-s',
    appId: '1:274685203608:android:76edcb189a9db708932ced',
    messagingSenderId: '274685203608',
    projectId: 'tienda-78a0e',
    storageBucket: 'tienda-78a0e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDiwbhr2DG-tj3G1GYTL1_HlxZ7cl6jHGQ',
    appId: '1:274685203608:ios:6bd3e009be60d3f7932ced',
    messagingSenderId: '274685203608',
    projectId: 'tienda-78a0e',
    storageBucket: 'tienda-78a0e.appspot.com',
    iosClientId: '274685203608-1cadp8d7p4428ett3dsbt2suug3a3n60.apps.googleusercontent.com',
    iosBundleId: 'com.example.tienda',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDiwbhr2DG-tj3G1GYTL1_HlxZ7cl6jHGQ',
    appId: '1:274685203608:ios:7441ebfa39ad187f932ced',
    messagingSenderId: '274685203608',
    projectId: 'tienda-78a0e',
    storageBucket: 'tienda-78a0e.appspot.com',
    iosClientId: '274685203608-smmcva087u8ui4cn01kt7jpo7qm3orho.apps.googleusercontent.com',
    iosBundleId: 'com.example.tienda.RunnerTests',
  );
}
