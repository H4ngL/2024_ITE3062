import 'package:get/get.dart';

class LoadingController extends GetxController {
  static LoadingController get to => Get.find();
  final RxBool isLoading = false.obs;

  void changeLoadingState(bool state) {
    isLoading.value = state;
  }
}
