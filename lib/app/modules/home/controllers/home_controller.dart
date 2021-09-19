import 'package:get/get.dart';
import 'package:recipe/app/constants/api_errors.dart';
import 'package:recipe/app/models/tesla_news_response.dart';
import 'package:recipe/app/services/api_helper.dart';

class HomeController extends GetxController {
  RxList<Articles> teslaNewsArticles = <Articles>[].obs;
  ApiHelper apiHelper = Get.find<ApiHelper>();

  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void fetchNews() {
    apiHelper.getTeslaNews().then(
      (response) {
        if (response.status.connectionError)
          Get.snackbar(ApiErrors.noInternet, ApiErrors.noInternetDetails);
        else {
          TeslaNewsResponse data = TeslaNewsResponse.fromJson(response.body);
          teslaNewsArticles.value = data.articles!;
        }
      },
    );
  }
}
