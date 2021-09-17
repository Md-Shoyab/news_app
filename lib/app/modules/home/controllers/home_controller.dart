import 'package:get/get.dart';
import 'package:recipe/app/services/api_helper.dart';

class HomeController extends GetxController {
  RxString imageUrl =
      'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80'
          .obs;
  ApiHelper apiHelper = Get.find<ApiHelper>();

  @override
  void onInit() {
    super.onInit();
    getReceipesList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void getReceipesList() {
    apiHelper.getReceipesList().then((response) {
      if (response.hasError) {
        Get.back();
        print('Api Has Error. ${response.statusCode}');
      } else {
        Get.back();
        print('Api Has Data.');
        print(response.body.toString());
      }
    });
  }
}
