import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Sign in anonymously
  static Future<User?> signInAnonymously() async {
    final UserCredential userCredential =
        await _firebaseAuth.signInAnonymously();
    return userCredential.user;
  }

  // Log out
  static Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // Check if the user is signed in
  static bool get isSignedIn => _firebaseAuth.currentUser != null;

  // Get the current user
  static User? get currentUser => _firebaseAuth.currentUser;
}
