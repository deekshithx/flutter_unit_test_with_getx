import 'dart:convert';
import 'dart:io';

import 'package:cryptop/infrastructure/urls.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'app_exceptions.dart';

class AppServices {
  static const baseUrl = ApiUrls.baseUrl;

  static Future fetchPairDetails(String currencyPair) async {
    try {
      var requestUrl =
          Uri.parse('$baseUrl${ApiUrls.loadPairData}$currencyPair');
      final response = await http.get(
        requestUrl,
      );
      return _renderResponse(response);
    } on SocketException {
      appPrint('No Internet');
      throw FetchDataException('No Internet connection');
    }
  }

  static Future fetchOrderBook(String currencyPair) async {
    try {
      var requestUrl = Uri.parse('$baseUrl${ApiUrls.orderBook}$currencyPair');
      final response = await http.get(
        requestUrl,
      );
      return _renderResponse(response);
    } on SocketException {
      appPrint('No Internet');
      throw FetchDataException('No Internet connection');
    }
  }

  static dynamic _renderResponse(http.Response response) {
    appPrint("------------------------------");
    appPrint("Status Code ${response.statusCode}");
    appPrint("------------------------------");
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 204:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 403:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 404:
        return null;
      // throw UnauthorisedException(response.data.toString());
      case 422:
        var responseJson = json.decode(response.body);
        return responseJson;
      // throw ValidationException(response.data.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  static appPrint(message) {
    if (kDebugMode) debugPrint(message);
  }
}
