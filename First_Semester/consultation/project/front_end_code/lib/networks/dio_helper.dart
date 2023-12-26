// ignore_for_file: public_member_api_docs, sort_constructors_first
/// @author Abdelaziz Salah
/// @date 23/11/2022
/// this is a DioHelper which is a class used to connect us to the backend
/// and deal with the server
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:front_end_code/shared_preferences.dart/shared_preferences.dart';
import 'constant_end_points.dart';

class DioHelper {
  static late Dio dio;

  /// this is the initializer function used to set the base options such as
  /// the base url value
  /// and the limits for the timeouts
  /// and the headers
  static init() {
    print('initializing Dio');
    dio = Dio(
      BaseOptions(
        /// this is the base url for our dio connections
        baseUrl: baseUrl,

        /// this allow receiving data even if the status was error
        /// also allows be to read the debug errors if any has occurred
        receiveDataWhenStatusError: true,

        /// this allows me to define how much time I should wait
        /// before ending the connection, depending on the internet speed
        /// note that time is in milli.
        /// I want it to wait 10 seconds before ending
        connectTimeout: 10 * 1000,

        receiveTimeout: 20 * 1000,

        /// this is a map of headers
        // headers: {
        //   'Content-Type':
        //       'multipart/form-data; boundary=<calculated when request is sent>'
        // },
        // contentType:
        //     'multipart/form-data; boundary=<calculated when request is sent>',
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        // this is a function which is called when the response is sent
        onRequest: (options, handler) {
          // show loading indicator
          // showDialog(
          //   context: navigatorKey.currentContext!,
          //   barrierDismissible: false,
          //   builder: (context) => const Center(
          //     child: CircularProgressIndicator(),
          //   ),
          // );

          return handler.next(options);
        },

        /// this is a function which is called when the response is received
        onResponse: (response, handler) {
          // Hide the loading indicator.
          // Navigator.pop(navigatorKey.currentContext!);
          return handler.next(response);
        },
        onError: (e, handler) => handler.next(e),
      ),
    );
  }

  /// this is a utility function which I made, in order to help me
  /// converting the response into map formante.
  /// because the json is returned in shape of string json like this
  /// " { "key": "value" } ...}" so i wanted to convert it into map to
  /// can access the data easily, by its name exists in the API documentations.
  ///
  /// @param [response] which is the response returned from the server.
  /// @return [Map] which is the map of the response.
  static Map<dynamic, dynamic> gettingJsonResponse(response) {
    final responseAsJSON = jsonDecode(response.data);
    final myMap = {};
    responseAsJSON.forEach((key, value) {
      myMap.addAll({key: value});
    });

    return myMap;
  }

  /// now we need to define the web Services
  /// this is a function used to send post request with certain body.
  static Future<Response> postData({
    required String path, // the added path to the baseURL
    required dynamic data,

    /// which is the content of the JSON
    Map<String, dynamic>? query,
    String? sentToken,
    bool isFormdata = false,
    Function(int, int)? onSendProgress,

    /// additional query
  }) async {
    sentToken ??= token;
    var options = Options(
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': (isFormdata)
            ? 'multipart/form-data; boundary=<calculated when request is sent>'
            : 'application/json'
      },
    );

    return await dio.post(path,
        data: data,
        options: options,
        queryParameters: query,
        onReceiveProgress: onSendProgress,
        onSendProgress: onSendProgress);
  }

  /// this is a function used to send put request with certain body to replace
  /// certain object in the date base.
  static Future<Response> putData({
    required String path, // the added path to the baseURL
    required dynamic data,

    /// which is the content of the JSON
    Map<String, dynamic>? query,
    String? sentToken,
    isBytes = false,

    /// additional query
  }) async {
    final type = isBytes ? 'octet-stream' : 'json';
    print(type);
    sentToken ??= CacheHelper.getData(key: 'token');
    var options = Options(
      headers: {
        'Authorization': 'Bearer ${sentToken ?? ''}',
        'Content-Type': 'application/$type'
        //; charset=utf-8'
      },
    );

    return await dio.put(
      path,
      data: data,
      options: options,
      queryParameters: query,
    );
  }

  /// this function is used to send patch request to the backend.
  static Future<Response> patchData({
    required String path,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,

    /// additional query
  }) async {
    token ??= CacheHelper.getData(key: 'token');
    var options = Options(
      headers: {
        'Authorization': 'Bearer ${token ?? ''}',
        'Content-Type': 'application/json; charset=utf-8'
      },
    );

    return await dio.patch(
      path,
      data: data,
      options: options,
      queryParameters: query,
    );
  }

  /// this is a function used to send get request with certain body.
  /// patch function

  /// this is a function used to send get request with certain body.
  /// patch function
  /// this is a function used to send get request
  /// @param [query] which is the query we are asking for <optional>
  /// @param [path] string defining the end point
  static Future<Response> getData({
    Map<String, dynamic>? query,
    required String path,
  }) async {
    Options options;
    options = Options(
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=utf-8'
      },
    );

    return await dio.get(
      path,
      queryParameters: query,
      options: options,
    );
  }

  static Future<Response> deleteData({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
  }) async {
    Options options;

    options = Options(
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=utf-8'
      },
    );

    return await dio.delete(
      path,
      options: options,
      queryParameters: query,
      data: data,
    );
  }
}
