import 'package:core/core.dart';
import 'package:posts/src/core/enum.dart';
import 'package:posts/src/data/responses/post_response_data_children/post_response_data_children_adapter.dart';
import '../../models/post/post.dart';
import 'base_response.dart';

BaseResponse adaptJsonToBaseResponse<T>(json) => BaseResponse(
  kind: stringToEnum(json['kind'], ResponseKind.values)??ResponseKind.Listing,
  responseData: adaptJsonToResponseData<T>(json['data']),
);

ResponseData adaptJsonToResponseData<T>(json) => ResponseData(
  children: adaptJsonToResponseDataChildren<T>(json['children']),
);

List<ResponseDataChild> adaptJsonToResponseDataChildren<T>(List json) {
  switch(T) {
    // case ResponseDataChildKind.t1:
    //   return []; // TODO

    case Post:
      json.removeWhere((value) => stringToEnum(value['kind'], ResponseDataChildKind.values) != ResponseDataChildKind.t3);
      return adaptJsonToPostResponseDataChildren(json);

    default: return [];
  }
}


// ResponseDataChild adaptJsonToResponseDataChild(json) {
//   switch(stringToEnum(json['kind'], ResponseDataChildKind.values)) {
//     case ResponseDataChildKind.t1:
//       return []; // TODO
//
//     case ResponseDataChildKind.t3:
//       return adaptJsonToPostResponseDataChild(json);
//
//     default: return [];
//   }
// }
