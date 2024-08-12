import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 1),
        baseUrl: 'http://192.168.1.17:8000/api/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'multipart/form-data',
          'Accept': '*/*',
        },
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio.get(url, queryParameters: query);
  }

  static Future<Null> signOut(
      {required String? token, required String url}) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    await dio.post(url, options: Options(responseType: ResponseType.plain));
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    if (token != null) {
      dio.options.headers["Authorization"] = "Bearer $token";
    }
    FormData formData = FormData.fromMap(data);
    return await dio.post(
      url,
      queryParameters: query,
      data: formData,
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      ),
    );
  }
}
