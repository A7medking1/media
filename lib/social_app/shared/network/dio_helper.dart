import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  // ************************

  static Future<Response> getData({
    Map<String, dynamic>? query,
    required String uri ,
    String lang = 'en',
    String? token ,
  }) async
  {
    dio.options.headers =
    {
      'Content-Type':'application/json',
      'lang': lang ,
      'Authorization': token,
    };
    return await dio.get(
      uri,
      queryParameters: query,
    );
  }

  // *******************************

  static Future<Response> postData({
    Map<String, dynamic>? query,
    required String uri ,
    required Map<String, dynamic>? data,
    String lang = 'en',
    String token = '' ,
  }) async
  {
     dio.options.headers =
    {
      'Content-Type':'application/json',
      'lang': lang ,
      'Authorization': token,
    };
    return await dio.post(
      uri,
      queryParameters: query,
      data: data,
    );
  }
}
