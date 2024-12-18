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
    apiKey: 'AIzaSyDBmiu-469bqoiddJ3x3OvCjLD9ONgo58o',
    appId: '1:906563288209:web:af2b04512a07024ed79330',
    messagingSenderId: '906563288209',
    projectId: 'pile-up-e7446',
    authDomain: 'pile-up-e7446.firebaseapp.com',
    storageBucket: 'pile-up-e7446.appspot.com',
    measurementId: 'G-HPPQ2PTWPY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA2FZ_dqHnqAR8_lViQkSJXxVnefw9FpfY',
    appId: '1:906563288209:android:44260fcef16a1cd8d79330',
    messagingSenderId: '906563288209',
    projectId: 'pile-up-e7446',
    storageBucket: 'pile-up-e7446.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCSQa41mMhfrEoWtcUJWU6v8FkqzwpIylc',
    appId: '1:906563288209:ios:f8ab9a95dbd59b55d79330',
    messagingSenderId: '906563288209',
    projectId: 'pile-up-e7446',
    storageBucket: 'pile-up-e7446.appspot.com',
    iosBundleId: 'com.example.pileUp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCSQa41mMhfrEoWtcUJWU6v8FkqzwpIylc',
    appId: '1:906563288209:ios:f8ab9a95dbd59b55d79330',
    messagingSenderId: '906563288209',
    projectId: 'pile-up-e7446',
    storageBucket: 'pile-up-e7446.appspot.com',
    iosBundleId: 'com.example.pileUp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDBmiu-469bqoiddJ3x3OvCjLD9ONgo58o',
    appId: '1:906563288209:web:45a13bc559caceffd79330',
    messagingSenderId: '906563288209',
    projectId: 'pile-up-e7446',
    authDomain: 'pile-up-e7446.firebaseapp.com',
    storageBucket: 'pile-up-e7446.appspot.com',
    measurementId: 'G-TQ4NH6JW3M',
  );
}
