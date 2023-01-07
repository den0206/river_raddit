import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/providers/firebase_providers.dart';

final authRepositryProvider = Provider<AuthRepositry>((ref) {
  final firestore = ref.read(firestoreProvider);
  final auth = ref.read(authProvider);
  final googleSignIn = ref.read(googleSignInProvider);

  return AuthRepositry(firestore, auth, googleSignIn);
});

class AuthRepositry {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  AuthRepositry(this._firestore, this._auth, this._googleSignIn);

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      print(userCredential.user?.email);
    } catch (e) {
      print(e.toString());
    }
  }
}
