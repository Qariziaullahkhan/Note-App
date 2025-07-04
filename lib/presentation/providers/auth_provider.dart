import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;
  Future<void>signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      notifyListeners();
    } catch (e) {
      print("Sign up error: $e");
      rethrow;
    }
  }
  Future<void>signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      notifyListeners();
    } catch (e) {
      print("Sign in error: $e");
      rethrow;
    }
  }
  Future<void>logout() async {
    try {
      await _auth.signOut();
      notifyListeners();
    } catch (e) {
      print("Sign out error: $e");
      rethrow;
    }
  }
    Stream<User?> authStateChanges() => _auth.authStateChanges();

}
