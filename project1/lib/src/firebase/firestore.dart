import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project1/src/firebase/auth.dart';

class Firestore {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static void addName(String name) {
    if (Auth.isSignedIn) {
      _firestore.collection('user').doc(Auth.currentUser!.uid).set({
        'name': name,
      });
    }
  }
}
