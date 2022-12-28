import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ituring/http/api.dart';

import 'interceptors/common_parameter_interceptor.dart';
import 'interceptors/error_interceptor.dart';

HttpManager httpManager = HttpManager.getInstance();

class HttpManager {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";
  static const CONTENT_TYPE_IMAGE = "image/*";

  static HttpManager _instance = HttpManager._internal();

  factory HttpManager.getInstance() => _getInstance();

  static _getInstance() {
    return _instance;
  }

  late Dio _dio;

  HttpManager._internal() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: Api.BASE_URL,
      connectTimeout: 10000,
      receiveTimeout: 3000,
      headers: {
        "content-type": CONTENT_TYPE_FORM,
        "responseType": ResponseType.plain,
      },
    );

    _dio = Dio(baseOptions);
    _dio.interceptors.add(LogInterceptor(responseBody: true));
    _dio.interceptors.add(CommonParameterInterceptor());
    _dio.interceptors.add(ErrorInterceptors(_dio));
  }

  Future request(
    String path, {
    baseUrl,
    targetUrl,
    data,
    options,
  }) async {
    if (targetUrl != null) {
      path = targetUrl;
      _dio.options.baseUrl = "";
    } else {
      _dio.options.baseUrl = Api.BASE_URL;
    }

    Response response;

    if (data is FormData) {
      response = await _dio.request(path, data: data, options: options);
    } else {
      response =
          await _dio.request(path, queryParameters: data, options: options);
    }
    if (response.data is Map) {
      return response.data;
    }
    return jsonDecode(response.data.toString());
  }
}
