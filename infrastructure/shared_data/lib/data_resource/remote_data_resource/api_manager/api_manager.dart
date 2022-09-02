
import 'package:dio/dio.dart';

mixin ApiManager {
  void close({bool force=false});
  Future<dynamic> get({
    Map<String, String?> headers = const {},
    required String url,
  });
  Future<dynamic> post({
    Map<String, String?> headers = const {},
    required String url,
    Map? body,
  });
  Future<dynamic> put({
    Map<String, String?> headers = const {},
    required String url,
    Map? body,
  });
  Future<dynamic> delete({
    Map<String, String?> headers = const {},
    required String url,
    Map? body,
  });
  Future<dynamic> postMultiPart({
    required String url,
    required FormData body,
    Map<String, String?> headers = const {},
    Function(int count, int total)? onUploadingProgressChanged,
  });
}