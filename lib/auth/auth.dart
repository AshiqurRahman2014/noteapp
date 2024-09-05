import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Future<void> signIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  // Future<void> register(String email, String password, String name) async {
  //  await _auth.createUserWithEmailAndPassword(email: email, password: password);
  //   await _auth.currentUser?.updateDisplayName(name);
  // }

  Future<void> register(String email, String password, String name) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await _auth.currentUser?.updateDisplayName(name);
      print('User registered successfully');
    } catch (e) {
      print('Registration failed: $e');
      throw e;
    }
  }
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
