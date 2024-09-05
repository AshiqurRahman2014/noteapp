import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../auth/auth.dart';

class AuthController extends GetxController {
    final AuthService _authService = AuthService();

    bool get isLoggedIn => _authService.currentUser != null;

    Future<void> signIn(String email, String password) async {
        await _authService.signIn(email, password);
        Get.offAllNamed('/home');
    }

    Future<void> register(String email, String password, String name) async {
        await _authService.register(email, password, name);
        Get.offAllNamed('/home');
    }

    Future<void> signOut() async {
        await _authService.signOut();
        Get.offAllNamed('/login');
    }
}

