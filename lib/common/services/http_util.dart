import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:learnhub/common/utils/app_constants.dart';
import 'package:learnhub/global.dart';

class HttpUtil {
  // through this i am going to make this class private
  late Dio dio;
  static final HttpUtil _instance = HttpUtil._internal();

  //Singleton class : objects of this class have same hashcode or you may say same state

  factory HttpUtil() {
    return _instance; // by default constructor cant return
  }

  //you make private constructor so that this class and its things cant be called
  //from anywhere
  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.SERVER_API_URL,
      connectTimeout: Duration(seconds: 5),
      // try to connect for 5 seconds otherwise dont connect
      receiveTimeout: Duration(seconds: 5),
      headers: {},
      contentType: "application/json: charset= utf-8",
      responseType: ResponseType.json,
    );
    dio = Dio(options);

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      print('App response data: ${response.data}');
      return handler.next(response);
    }, onError: (exception, handler) {

      ErrorEntity errorInfo = createErrorEntity(exception);
      onError(errorInfo);
    }));
  }

  //these headers will have access token which helps the server to check whether
  //we are right user or not
  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var accessToken = Global.storageService.getUserToken();
    if (accessToken.isNotEmpty) {
      headers['Authorization'] = "Bearer $accessToken";
    }
    return headers;
  }

  Future post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    // as we have set content type json which is for text
    // but if you want to change it you can do by sending optional parameter
    // options

    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    Map<String, dynamic>? authorization = getAuthorizationHeader();

    //replace old headers with new header
    // because every time we are getting different access token
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    var response = await dio.post(path,
        data: data, queryParameters: queryParameters, options: requestOptions);

    return response.data;
  }
}

class ErrorEntity implements Exception {
  int code = -1;
  String message = "";

  ErrorEntity({required this.code, required this.message});

  @override
  String toString() {
    if (message == "") return "Exception";

    return "Exception code $code, $message";
  }
}

ErrorEntity createErrorEntity(DioException exception) {
  switch (exception.type) {
    case DioExceptionType.connectionTimeout:
      return ErrorEntity(code: -1, message: "Connection Timed out");
    case DioExceptionType.sendTimeout:
      return ErrorEntity(code: -1, message: "Send Timed out");
    case DioExceptionType.receiveTimeout:
      return ErrorEntity(code: -1, message: "Receive Timed out");
    case DioExceptionType.badCertificate:
      return ErrorEntity(code: -1, message: "Bad SSL certificate");
    case DioExceptionType.badResponse:
      switch (exception.response!.statusCode) {
        case 400:
          return ErrorEntity(code: 400, message: "Server Syntax error");
        case 401:
          return ErrorEntity(code: 401, message: "You are denied to continue");
        case 500:
          return ErrorEntity(code: 500, message: "Server Internal Error");
        default:
          return ErrorEntity(code: -1, message: "Default error");
      }
    case DioExceptionType.cancel:
      return ErrorEntity(code: -1, message: "Server Canceled it");
    case DioExceptionType.connectionError:
      return ErrorEntity(code: -1, message: "Connection Error");
    case DioExceptionType.unknown:
      return ErrorEntity(code: -1, message: "Unknown Error");
  }
}

void onError(ErrorEntity errorInfo) {
  print(errorInfo.code);
  switch (errorInfo.code) {
    case 400:
      print("Server syntax Error");
      break;

    case 401:
      print("You are denied to continue");
      break;

    case 500:
      print("Internal Server Error");
      break;

    default:
      print("Unknown");
  }
}
