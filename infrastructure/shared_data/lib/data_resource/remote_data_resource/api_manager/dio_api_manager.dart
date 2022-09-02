import 'dart:convert';
import 'package:shared_data/data_resource/remote_data_resource/helper/api_error_handler.dart';
import 'package:dio/dio.dart';
import '../helper/api_utils.dart';
import 'api_manager.dart';

class DioApiManager with ApiManager {
  final Dio _dio;
  DioApiManager({
    required dio,
  }) : _dio = dio;

  static const String logTag = 'DioApiManager';

  Future<dynamic> _handleApiRequest({
    required Future<Response<dynamic>> request,
  }) async {
    try {
      final response = await request;
      return response.data;
    } on DioError catch (e) {
      ApiErrorHandler.onError(e);
    } catch (e) {
      throw const FormatException('something_went_wrong');
    }
  }


  @override
  close({bool force= false}) {
    _dio.close(force: force);
  }

  @override
  Future<dynamic> get({required String url, Map<String, String?> headers = const {}}) async {
    return await _handleApiRequest(
      request: _dio.get(url, options: Options(headers: headers,),),
    );
  }

  @override
  Future<dynamic> post({required String url, Map? body, Map<String, String?> headers = const {}}) async {
    ApiUtils.removeNullMapObjects(body);
    return await _handleApiRequest(
      request: _dio.post(
        url,
        data: body!=null ? json.encode(body) : null,
        options: Options(headers: headers),
      ),
    );
  }

  @override
  Future<dynamic> put({required String url, Map? body, Map<String, String?> headers = const {}}) async {
    ApiUtils.removeNullMapObjects(body);
    return await _handleApiRequest(
      request: _dio.put(
        url,
          data: body!=null ? json.encode(body) : null,
          options: Options(headers: headers),
      ),
    );
  }

  @override
  Future<dynamic> delete({required String url, Map? body, Map<String, String?> headers = const {}}) async {
    return await _handleApiRequest(
      request: _dio.delete(
          url,
          data: body!=null ? json.encode(body) : null,
          options: Options(headers: headers),
      ),
    );
  }

  @override
  Future<dynamic> postMultiPart({
    required String url,
    required FormData body,
    Map<String, String?> headers = const {},
    Function(int count, int total)? onUploadingProgressChanged,
  }) async {
    return await _handleApiRequest(
      request: _dio.post(
        url,
        data: body,
        options: Options(headers: headers,),
        onSendProgress: onUploadingProgressChanged,
      ),
    );
  }
}