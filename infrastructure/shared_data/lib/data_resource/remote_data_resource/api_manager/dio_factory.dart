import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  _initDioWithLogInterceptor(Dio dio) {
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
      logPrint: (object) => debugPrint(object.toString()),
    ));
  }

  Dio provideDio({required String baseUrl, Interceptor? interceptor}) {
    Dio dio = Dio()..options.baseUrl = baseUrl;
    if(interceptor!=null) dio.interceptors.add(interceptor);
    return dio;
  }
}