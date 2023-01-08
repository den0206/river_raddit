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

class AuthController extends StateNotifier<bool> {
  final AuthRepositry _authRepositry;
  final Ref ref;

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
}
