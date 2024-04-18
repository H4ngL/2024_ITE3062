import 'package:get/get.dart';

enum MainType { prompt, color, code }

const stm = {
  '프롬프트': MainType.prompt,
  '중심 색상': MainType.color,
  '색상 코드': MainType.code,
};

class MainTypeController extends GetxController {
  static MainTypeController get to => Get.find();
  final Rx<MainType> mainType = MainType.prompt.obs;

  void changeMainType(MainType type) {
    mainType.value = type;
  }
}
