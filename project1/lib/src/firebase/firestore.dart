import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project1/src/controller/setting.dart';
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

  static void logAdvancedSettingsColorCount(int colorCount) {
    if (Auth.isSignedIn) {
      _firestore
          .collection('user')
          .doc(Auth.currentUser!.uid)
          .collection('logs')
          .doc()
          .set({
        'timestamp': FieldValue.serverTimestamp(),
        'action': 'change color count',
        'colorCount': colorCount,
      });
    }
  }

  static void logAdvancedSettingsColorMix(ColorMix colorMix) {
    if (Auth.isSignedIn) {
      _firestore
          .collection('user')
          .doc(Auth.currentUser!.uid)
          .collection('logs')
          .doc()
          .set({
        'timestamp': FieldValue.serverTimestamp(),
        'action': 'check color mixing',
        'colorMix': colorMix.toString().split('.').last,
      });
    }
  }

  static void logAdvancedSettingsOpacity(double opacity) {
    if (Auth.isSignedIn) {
      _firestore
          .collection('user')
          .doc(Auth.currentUser!.uid)
          .collection('logs')
          .doc()
          .set({
        'timestamp': FieldValue.serverTimestamp(),
        'action': 'change opacity',
        'opacity': opacity,
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
