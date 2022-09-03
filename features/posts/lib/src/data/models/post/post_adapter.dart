import 'package:posts/src/data/models/post/post.dart';
import 'package:posts/src/data/responses/post_response_data_children/post_response_data_child.dart';

import '../../responses/base_response/base_response.dart';

List<Post> adaptBaseResponseToPosts(BaseResponse baseResponse) =>
    (baseResponse.responseData.children as List<PostResponseDataChild>).map((e) => e.post).toList();

List<Post> adaptJsonToPosts(json) => List<Post>.from(json.map((x) => adaptJsonToPost(x)));

Post adaptJsonToPost(json) => Post(
  authorName: json['author_fullname']??'',
  name: json['name']??'',
  publishedAt: DateTime.fromMillisecondsSinceEpoch(double.parse((json['created_utc']??0.0).toString()).toInt()* 1000, isUtc: true),
  body: json['selftext']!='' ? json['selftext'] : (json['title']??''),
  commentsCount: json['num_comments']??0,
);

