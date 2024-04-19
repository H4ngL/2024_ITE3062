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

  // log main type
  static void logMainType(String mainType) {
    if (Auth.isSignedIn) {
      _firestore
          .collection('user')
          .doc(Auth.currentUser!.uid)
          .collection('logs')
          .doc()
          .set({
        'timestamp': FieldValue.serverTimestamp(),
        'action': 'change main type',
        'mainType': mainType,
      });
    }
  }

  // log advanced settings
  static void logAdvancedSettings(bool isChecked) {
    if (Auth.isSignedIn) {
      _firestore
          .collection('user')
          .doc(Auth.currentUser!.uid)
          .collection('logs')
          .doc()
          .set({
        'timestamp': FieldValue.serverTimestamp(),
        'action': 'check advanced settings',
        'isChecked': isChecked,
      });
    }
  }

  // log generate
  static void logGenerate() {
    if (Auth.isSignedIn) {
      _firestore
          .collection('user')
          .doc(Auth.currentUser!.uid)
          .collection('logs')
          .doc()
          .set({
        'timestamp': FieldValue.serverTimestamp(),
        'action': 'generate',
      });
    }
  }

  // palette copy
}
