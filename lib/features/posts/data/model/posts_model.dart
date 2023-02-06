import 'package:dummy_api/features/posts/domain/entity/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'posts_model.freezed.dart';
part 'posts_model.g.dart';

@freezed
class PostsModel with _$PostsModel {
  const PostsModel._();
  const factory PostsModel({
    required int id,
    required String title,
    required String body,
  }) = _PostsModel;

  factory PostsModel.fromJson(Map<String, dynamic> json) =>
      _$PostsModelFromJson(json);

  Post toDomain() => Post(id: id, title: title, body: body);
}
