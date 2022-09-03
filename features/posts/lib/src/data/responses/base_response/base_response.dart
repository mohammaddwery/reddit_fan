import '../../../core/enum.dart';

class BaseResponse {
  final ResponseKind kind;
  final ResponseData responseData;
  BaseResponse({required this.kind, required this.responseData});
}

class ResponseData {
  final List<ResponseDataChild> children;
  ResponseData({required this.children,});
}

class ResponseDataChild {
  final ResponseDataChildKind kind;
  ResponseDataChild({required this.kind,});
}