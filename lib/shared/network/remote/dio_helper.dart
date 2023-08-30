import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        /// baseUrl: 'http://127.0.0.1:8000/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    required dynamic data,
    String? token,
  }) async {
    log(data.toString());
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token == null ? "" : 'Bearer ${token}'
    };
    final response  =  await dio.post(
      url,
      data: data,
    );
    return response ;
  }

  static Future<Response> putData({
    required String url,
    required dynamic data,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",
    };

    return await dio.put(
      url,
      data: data,
    );
  }

  static Future<Response> getData({
    required String url,
    dynamic query,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
}
