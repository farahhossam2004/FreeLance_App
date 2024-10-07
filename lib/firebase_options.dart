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
    apiKey: 'AIzaSyC-yEv-UeSJg085HEhA_4un5mfsHe8m78A',
    appId: '1:236400484934:web:28e19b8a144f4ae5f5a047',
    messagingSenderId: '236400484934',
    projectId: 'free-lance-app-d1c68',
    authDomain: 'free-lance-app-d1c68.firebaseapp.com',
    storageBucket: 'free-lance-app-d1c68.appspot.com',
    measurementId: 'G-THGCTNN2J6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCoieXFrCzhyuKFQy0q4AvPMUZdIfhzMSY',
    appId: '1:236400484934:android:bcefdef0e3d9ecc8f5a047',
    messagingSenderId: '236400484934',
    projectId: 'free-lance-app-d1c68',
    storageBucket: 'free-lance-app-d1c68.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC5yn8_F0yLZxS8RKKLMg2SFaoarVHEQS8',
    appId: '1:236400484934:ios:9cac9e2038fd7f9df5a047',
    messagingSenderId: '236400484934',
    projectId: 'free-lance-app-d1c68',
    storageBucket: 'free-lance-app-d1c68.appspot.com',
    iosBundleId: 'com.example.freelanceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC5yn8_F0yLZxS8RKKLMg2SFaoarVHEQS8',
    appId: '1:236400484934:ios:9cac9e2038fd7f9df5a047',
    messagingSenderId: '236400484934',
    projectId: 'free-lance-app-d1c68',
    storageBucket: 'free-lance-app-d1c68.appspot.com',
    iosBundleId: 'com.example.freelanceApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC-yEv-UeSJg085HEhA_4un5mfsHe8m78A',
    appId: '1:236400484934:web:184c8aa7c87092e0f5a047',
    messagingSenderId: '236400484934',
    projectId: 'free-lance-app-d1c68',
    authDomain: 'free-lance-app-d1c68.firebaseapp.com',
    storageBucket: 'free-lance-app-d1c68.appspot.com',
    measurementId: 'G-KWLTHYV2RT',
  );
}