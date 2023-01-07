import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_raddit/src/feature/auth/repositry/auth_repositry.dart';

final authControllerProvider = Provider<AuthController>((ref) {
  return AuthController(ref.read(authRepositryProvider));
});

class AuthController {
  final AuthRepositry _authRepositry;

  AuthController(this._authRepositry);

  Future<void> signInWithGoogle() async {
    await _authRepositry.signInWithGoogle();
  }
}
