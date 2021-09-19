import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get.dart';
import 'package:recipe/app/constants/api_constants.dart';
import 'package:recipe/app/constants/api_errors.dart';
import 'package:recipe/app/utils/loader.dart';
import 'base_api_helper.dart';

class ApiHelper extends GetConnect with BaseApiHelper {
  @override
  void onInit() {
    httpClient.baseUrl = API_BASE_URL;
    httpClient.errorSafety = true;
    httpClient.timeout = Duration(seconds: 5);

    httpClient.addRequestModifier(
      (Request<dynamic> request) {
        Loader().showLoadingWidget();
        print('----Add addRequestModifier Called----');
        return request;
      },
    );

    httpClient.addResponseModifier(
      (request, response) {
        debugPrint(
          '\n╔══════════════════════════ Response ══════════════════════════\n'
          '╟ REQUEST ║ ${request.method.toUpperCase()}\n'
          '╟ url: ${request.url}\n'
          '╟ Headers: ${request.headers}\n'
          '╟ Body: ${request.bodyBytes.map((event) => event.asMap().toString())}\n'
          '╟ Status Code: ${response.statusCode}\n'
          '╟ Data: ${response.bodyString?.toString() ?? ''}'
          '\n╚══════════════════════════ Response ══════════════════════════\n',
          wrapWidth: 1024,
        );
        if (response.hasError) {
          // Get.back() is used for removing Loader().showLoadingWidget();
          Get.back();
          if (response.status.code == 400)
            Get.snackbar(ApiErrors.badRequest, ApiErrors.badRequestDetails);
          else if (response.status.isUnauthorized)
            Get.snackbar(ApiErrors.unauthorised, ApiErrors.unauthorisedDetails);
          else if (response.status.isForbidden)
            Get.snackbar(ApiErrors.forbidden, ApiErrors.forbiddenDetails);
          else if (response.status.code == 408)
            Get.snackbar(
                ApiErrors.serverTimeOut, ApiErrors.serverTimeOutDetails);
          else if (response.status.isNotFound)
            Get.snackbar(
                ApiErrors.serverNotFound, ApiErrors.serverNotFoundDetails);
          else if (response.status.isServerError)
            Get.snackbar(ApiErrors.serverError, ApiErrors.serverErrorDetails);
          else
            Get.snackbar(ApiErrors.unknownError, ApiErrors.unknownErrorDetails);
        } else if (response.isOk) {
          // Get.back() is used for removing Loader().showLoadingWidget();
          Get.back();
        }
      },
    );
  }

  @override
  Future<Response> getTeslaNews() async {
    final response = await get(API_TESLA_NEWS);
    return response;
  }
}
