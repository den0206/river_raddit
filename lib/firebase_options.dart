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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBoZzRn2cq8SMM04SMB28IXpOmRjjsv0nA',
    appId: '1:675531863525:android:70eb006a0f5224532f6b0c',
    messagingSenderId: '675531863525',
    projectId: 'whatsup-clone-f042a',
    databaseURL: 'https://whatsup-clone-f042a.firebaseio.com',
    storageBucket: 'whatsup-clone-f042a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCDX9UBjnPUchpZGWNX_WF17CaFZat71bo',
    appId: '1:675531863525:ios:53fb91d57ed4fa072f6b0c',
    messagingSenderId: '675531863525',
    projectId: 'whatsup-clone-f042a',
    databaseURL: 'https://whatsup-clone-f042a.firebaseio.com',
    storageBucket: 'whatsup-clone-f042a.appspot.com',
    iosClientId: '675531863525-1k1hucqvtmu522vtv28qioimmttbru31.apps.googleusercontent.com',
    iosBundleId: 'com.example.riverRaddit',
  );
}
