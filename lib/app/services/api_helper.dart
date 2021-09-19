import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get.dart';
import 'package:recipe/app/constants/api_constants.dart';
import 'package:recipe/app/utils/loader.dart';
import 'base_api_helper.dart';

class ApiHelper extends GetConnect with BaseApiHelper {
  @override
  void onInit() {
    httpClient.baseUrl = API_BASE_URL;
    httpClient.errorSafety = false;
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
      },
    );
  }

  @override
  Future<Response> getTeslaNews() async {
    final response = await get(API_TESLA_NEWS);
    return response;
  }
}
