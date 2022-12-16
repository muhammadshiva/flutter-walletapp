import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:moneywise_app/shared/shared_values.dart';

// import 'package:scriptmatic/env/env.dart' as AppEnv;
import 'package:moneywise_app/utils/extensions.dart' as AppExt;

import 'api_exceptions.dart';

class ApiDio {
  Dio dio = Dio();
  final String _baseUrl = baseUrl;

  Future<dynamic> get(dynamic url, {Map<String, String>? headers}) async {
    var responseJson;

    if (await AppExt.hasConnection()) {
      final response = await dio.get(
        _baseUrl + url,
        options:
            Options(headers: headers, validateStatus: (int? value) => true),
      );

      responseJson = _returnResponse(response);
    } else {
      throw NetworkException();
    }

    return responseJson;
  }

  Future<dynamic> post(dynamic url,
      {Map<String, dynamic>? formData, Map<String, dynamic>? headers}) async {
    var responseJson;

    if (await AppExt.hasConnection()) {
      FormData formDataGeneral = FormData.fromMap(formData ?? {});
      final response = await dio.post(
        _baseUrl + url,
        data: formDataGeneral,
        options:
            Options(headers: headers, validateStatus: (int? value) => true),
      );

      debugPrint("formdatafields ${formDataGeneral.fields}");
      debugPrint("formdatafiles ${formDataGeneral.files}");

      responseJson = _returnResponse(response);
    } else {
      throw NetworkException();
    }
    return responseJson;
  }

  Future<dynamic> put(dynamic url,
      {Map<String, dynamic>? formData, Map<String, dynamic>? headers}) async {
    var responseJson;

    if (await AppExt.hasConnection()) {
      FormData formDataGeneral = FormData.fromMap(formData!);
      final response = await dio.put(
        _baseUrl + url,
        data: formDataGeneral,
        options:
            Options(headers: headers, validateStatus: (int? value) => true),
      );

      debugPrint("formdatafields ${formDataGeneral.fields}");
      debugPrint("formdatafiles ${formDataGeneral.files}");

      responseJson = _returnResponse(response);
    } else {
      throw NetworkException();
    }
    return responseJson;
  }

  Future<dynamic> delete(dynamic url, {Map<String, dynamic>? headers}) async {
    var responseJson;

    if (await AppExt.hasConnection()) {
      final response = await dio.delete(
        _baseUrl + url,
        options:
            Options(headers: headers, validateStatus: (int? value) => true),
      );

      responseJson = _returnResponse(response);
    } else {
      throw NetworkException();
    }

    return responseJson;
  }

  dynamic _returnResponse(Response<dynamic> response) {
    if (kDebugMode) {
      String responseJsonStr = response.data.toString();
      String endpointPath = response.requestOptions.path;
      String endpointMethod = response.requestOptions.method;

      debugPrint(
          '\x1B[31m\n==================================================================================\x1B[0m');
      debugPrint(
          '\x1B[32m[$endpointMethod - ${response.statusCode}] $endpointPath\x1B[0m');
      debugPrint('\x1B[33m$responseJsonStr\x1B[0m');
    }

    switch (response.statusCode) {
      case 200:
        var responseJson = response.data;
        return responseJson;
      case 401:
        throw UnauthorisedException(
            "[401] " + response.data['message'].toString());
      case 404:
        throw NotFoundException("[404] " + response.data.toString());
      case 500:
        throw ServerException("[500] " + response.data.toString());
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
