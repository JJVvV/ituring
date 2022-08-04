import 'package:dio/dio.dart';

class CommonParameterInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({});
    super.onRequest(options, handler);
  }
}
