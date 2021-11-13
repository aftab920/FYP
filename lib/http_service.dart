import 'package:dio/dio.dart';

class HttpService {
  Dio _dio = Dio();
  final baseUrl = "http://192.168.0.112/WebAPIDemo/api";
  HttpService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
      ),
    );
    initializeInterceptors();
  }

  Future<Response> getRequest(String endPoint) async {
    Response response;

    try {
      response = await _dio.get(endPoint);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          print(error.message);
        },
        onRequest: (request, handler) {
          print("${request.method} ${request.path}");
        },
        onResponse: (response, handler) {
          print(response.data);
        },
      ),
    );
  }

  get(Uri parse) {}
}
