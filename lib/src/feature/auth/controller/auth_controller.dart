import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_raddit/src/core/utils.dart';
import 'package:river_raddit/src/feature/auth/repositry/auth_repositry.dart';

final authControllerProvider = Provider<AuthController>((ref) {
  return AuthController(ref.read(authRepositryProvider));
});

class AuthController {
  final AuthRepositry _authRepositry;

  AuthController(this._authRepositry);

  Future<void> signInWithGoogle(BuildContext context) async {
    final userModel = await _authRepositry.signInWithGoogle();

    userModel.fold((l) => showSnackBar(context, l.message), (r) => null);
  }
}
