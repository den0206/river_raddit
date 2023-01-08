import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_raddit/src/core/utils.dart';
import 'package:river_raddit/src/feature/auth/repositry/auth_repositry.dart';

import '../../../model/user.dart';

final userProvider = StateProvider<UserModel?>((ref) {
  return null;
});
final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(ref.read(authRepositryProvider), ref);
});

final authStateChangeProvider = StreamProvider<User?>((ref) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.authStateChange;
});

final getUserDataProvider = StreamProvider.family((ref, String uid) {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.getUserData(uid);
});

class AuthController extends StateNotifier<bool> {
  final AuthRepositry _authRepositry;
  final Ref ref;

  Stream<User?> get authStateChange => _authRepositry.authStateChange;

  AuthController(this._authRepositry, this.ref) : super(false);

  Future<void> signInWithGoogle(BuildContext context) async {
    state = true;
    final userModel = await _authRepositry.signInWithGoogle();

    state = false;
    userModel.fold(
      (l) => showSnackBar(context, l.message),
      (userModel) => ref.read(userProvider.notifier).update(
            (state) => userModel,
          ),
    );
  }

  Stream<UserModel> getUserData(String uid) {
    return _authRepositry.getUserData(uid);
  }
}
