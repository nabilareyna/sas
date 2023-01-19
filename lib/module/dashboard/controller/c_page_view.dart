import 'package:get/get.dart';
import 'package:sas/routes/routes.dart';

class CPgeView extends GetxController {
  RxInt pageIndex = 0.obs;

  void changePage(int i) async {
    switch (i) {
      case 1:
        Get.offAllNamed(Routes.history);
        break;
      case 2:
        pageIndex.value = i;
        Get.offAllNamed(Routes.profile);
        break;
      default:
        pageIndex.value = i;
        Get.offAllNamed(Routes.dashboard);
    }
  }
}
