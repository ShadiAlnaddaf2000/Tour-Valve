import 'package:dio/dio.dart';
import 'package:tour_valve/shared/services/remote/end_points.dart';
import 'package:tour_valve/shared/services/storage/cache_helper.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        // connectTimeout: const Duration(seconds: 1),
        baseUrl: Urls.domain,
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
    Map<String, dynamic> query = const {},
  }) async {
    var token = CacheHelper.getString('token');
    dio.options.headers["Authorization"] = "Bearer $token";

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
