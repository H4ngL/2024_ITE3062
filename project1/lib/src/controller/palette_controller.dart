import 'package:get/get.dart';

class PaletteController extends GetxController {
  static PaletteController get to => Get.find();
  final colors = <String>[].obs;
  final colorFeature = [].obs;

  void setColors(List<String> newColors) {
    colors.value = newColors;
  }

  void setColorFeature(List newColorFeature) {
    colorFeature.value = newColorFeature;
  }
}
