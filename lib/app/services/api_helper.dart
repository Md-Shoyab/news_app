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
    httpClient.errorSafety = true;

    httpClient.addRequestModifier(
      (Request<dynamic> request) {
        Loader().showLoadingWidget();
        request.headers['X-RapidAPI-Host'] = 'yummly2.p.rapidapi.com';
        request.headers['X-RapidAPI-Key'] =
            'ca35e29268mshd2c7c2c0c173e6ep14a0fbjsn464288c29a06';
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
  Future<Response> getReceipesList() async {
    final response = await get(API_RECEIPES_LIST);
    return response;
  }
}
