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
      _firestore.collection('admin').doc('info').set({
        'userNames': FieldValue.arrayUnion([name]),
      }, SetOptions(merge: true));
    }
  }

  static Future<bool> isDuplicatedName(String name) async {
    final snapshot = await _firestore.collection('admin').doc('info').get();
    if (!snapshot.exists) return false;
    final userNames = snapshot.data()!['userNames'] as List<dynamic>;
    return userNames.contains(name);
  }

  static void addLogNum() {
    if (Auth.isSignedIn) {
      _firestore.collection('user').doc(Auth.currentUser!.uid).set({
        'logNum': FieldValue.increment(1),
      }, SetOptions(merge: true));
    }
  }

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
      addLogNum();
    }
  }

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
      addLogNum();
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
      addLogNum();
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
      addLogNum();
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
      addLogNum();
    }
  }

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
      addLogNum();
    }
  }

  static void logPaletteCopy(String type) {
    if (Auth.isSignedIn) {
      _firestore
          .collection('user')
          .doc(Auth.currentUser!.uid)
          .collection('logs')
          .doc()
          .set({
        'timestamp': FieldValue.serverTimestamp(),
        'action': 'copy palette',
        'type': type,
      });
      addLogNum();
    }
  }
}
