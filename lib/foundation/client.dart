import 'package:dio/dio.dart';

class Client {
  Dio init() {
    Dio dio = Dio();
    dio.interceptors.add(ClientInterceptor());
    dio.options.baseUrl = 'https://api.github.com/search';
    return dio;
  }
}

class ClientInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Content-Type'] = 'application/json';
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }
}
