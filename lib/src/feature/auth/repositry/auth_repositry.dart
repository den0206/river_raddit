import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:river_raddit/src/core/constants/constants.dart';
import 'package:river_raddit/src/core/constants/firebase_constants.dart';
import 'package:river_raddit/src/core/failure.dart';
import 'package:river_raddit/src/core/type_defs.dart';
import 'package:river_raddit/src/model/user.dart';

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

  CollectionReference get _userCollection {
    return _firestore.collection(FirebaseConstants.usersCollection);
  }

  Stream<User?> get authStateChange => _auth.authStateChanges();

  AuthRepositry(this._firestore, this._auth, this._googleSignIn);

  FutureEither<UserModel> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User user = userCredential.user!;

      UserModel userModel;
      if (userCredential.additionalUserInfo!.isNewUser) {
        userModel = UserModel(
            name: user.displayName ?? "unknown",
            uid: user.uid,
            email: user.email ?? "unknown",
            profilePic: user.photoURL ?? Constants.avatarDefault,
            banner: Constants.bannerDefault,
            isAuthenticated: true,
            karma: 0,
            awards: []);

        await _userCollection
            .doc(userCredential.user!.uid)
            .set(userModel.toMap());
      } else {
        userModel = await getUserData(userCredential.user!.uid).first;
      }

      return right(userModel);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  Stream<UserModel> getUserData(String uid) {
    return _userCollection.doc(uid).snapshots().map(
        (event) => UserModel.fromMap(event.data() as Map<String, dynamic>));
  }
}
