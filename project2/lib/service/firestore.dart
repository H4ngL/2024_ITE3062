import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project2/model/submit_info.dart';

class FirestoreService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<void> submitData(SubmitInfo info) async {
    await _firestore.collection('user').doc(info.uid).set({
      'gender': info.gender,
      'age': info.age,
      'phoneDegree': info.phoneDegree,
      'offsetOrder': info.offsetOrder,
    });
  }
}
