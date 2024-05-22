import 'package:firebase_storage/firebase_storage.dart';
import 'package:project2/model/submit_info.dart';

class StorageService {
  static final FirebaseStorage _storage = FirebaseStorage.instance;

  static void saveImages(SubmitInfo info) {
    for (int i = 0; i < info.drawImages.length; i++) {
      Reference ref = _storage.ref().child('${info.uid}/$i.png');
      ref.putData(info.drawImages[i]);
    }
  }
}
