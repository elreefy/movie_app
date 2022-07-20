//import dio package
import 'dart:async';

import 'package:movie_app/constants/constants.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  static Map<String, dynamic> getHeaders(lang, token) => {
    'lang': lang,
    'Authorization': token ?? '',
    'Content-Type': 'application/json',
  };

  static Future<List<dynamic>> getTopMovies({
    //String url=baseUrl,
   // Map<String, dynamic>? query,
   // String lang = 'en',
    required String apiKey,
   // String? token,
  }) async {
   // dio.options.headers = getHeaders(lang, token);
    try {
      Response response = await dio.get(moviesUrl, queryParameters:{
        'apiKey': apiKey,
     //   'key': apiKey,
     //   'type': 'address',
     //   'sessiontoken': sessiontoken,
     //   'components': 'country:eg',
      });
      return response.data['items'];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
  static Future<dynamic> getComingMovies({
    //String url=baseUrl,
    // Map<String, dynamic>? query,

    // String lang = 'en',
    required String apiKey,

    // String? token,
  }) async {
    // dio.options.headers = getHeaders(lang, token);
    try {
      Response response = await dio.get(upComingMoviesUrl, queryParameters:{
        'apiKey': apiKey,
      });
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }


  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = getHeaders(lang, token);
    return dio
        .post(url, queryParameters: query, data: data)
        .catchError((error) {
      print('DIO CLASS ERROR: $error');
    });
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = getHeaders(lang, token);
    return dio
        .put(
      url,
      data: data,
    )
        .catchError((error) {
      print("DIO ERROR $error");
    });
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = getHeaders(lang, token);
    return dio
        .delete(
      url,
    )
        .catchError((error) {
      print("DIO ERROR $error");
    });
  }

  // static getPolyline({required String encodedPolyline}) {
  //   List<PointLatLng> points = polylinePoints.decodePolyline(encodedPolyline);
  //   List<LatLng> result =
  //       points.map((e) => LatLng(e.latitude, e.longitude)).toList();
  //   return result;
  // }
}