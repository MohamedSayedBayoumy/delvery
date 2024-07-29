import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../constants/api.dart';

class DioServices {
  static final dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
  static String userToken = "";

  static Future<Response> post(
      {String? url, dynamic data, Map<String, dynamic>? headers}) async {
    log("Api is ()=> ${Api.baseUrl}$url");
    final request = await dio.post(
      "${Api.baseUrl}$url",
      data: data,
    );

    return request;
  }

  static Future<Response> put(
      {String? url, dynamic data, Map<String, dynamic>? headers}) async {
    log("Api is ()=> ${Api.baseUrl}$url");
    final request = await dio.put(
      "${Api.baseUrl}$url",
      data: data,
    );

    return request;
  }

  static Future<Response> get(
      {String? url, dynamic data, Map<String, dynamic>? headers}) async {
    log("Api is ()=> $url");

    final request = await dio.get(
      "${Api.baseUrl}$url",
    );
    return request;
  }
}
