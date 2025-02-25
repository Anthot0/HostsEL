import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCf1Gxbyip71JIr4AaGu1R9fTlws09nlY',
    appId: '1:289472698538:web:f36816a6e6ac314b5718d3',
    messagingSenderId: '289472698538',
    projectId: 'host-s-el',
    authDomain: 'host-s-el.firebaseapp.com',
    storageBucket: 'host-s-el.firebasestorage.app',
    measurementId: 'G-JK851N9SLE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDQ6RBSA0UOd2CrXzZ8gMrK3wg92SRnpKc',
    appId: '1:289472698538:android:d52283cdd40639e45718d3',
    messagingSenderId: '289472698538',
    projectId: 'host-s-el',
    storageBucket: 'host-s-el.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCj1xzg-ftADB6p1BcGd8L0ODbMnCvAlUI',
    appId: '1:289472698538:ios:bbb05520313f3dc85718d3',
    messagingSenderId: '289472698538',
    projectId: 'host-s-el',
    storageBucket: 'host-s-el.firebasestorage.app',
    iosBundleId: 'com.example.monProjet',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCj1xzg-ftADB6p1BcGd8L0ODbMnCvAlUI',
    appId: '1:289472698538:ios:bbb05520313f3dc85718d3',
    messagingSenderId: '289472698538',
    projectId: 'host-s-el',
    storageBucket: 'host-s-el.firebasestorage.app',
    iosBundleId: 'com.example.monProjet',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCf1Gxbyip71JIr4AaGu1R9fTlws09nlY',
    appId: '1:289472698538:web:8775d4df30ab1cbc5718d3',
    messagingSenderId: '289472698538',
    projectId: 'host-s-el',
    authDomain: 'host-s-el.firebaseapp.com',
    storageBucket: 'host-s-el.firebasestorage.app',
    measurementId: 'G-8ELP8ZG1V8',
  );
}
