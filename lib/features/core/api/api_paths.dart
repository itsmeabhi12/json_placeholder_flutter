import 'package:dummy_api/features/core/api/api_config.dart';

class ApiPath {
  static const endpoint = "https://jsonplaceholder.typicode.com";

  //products path
  static const posts = '$endpoint/posts';
  static String getPostsPath(int page) =>
      "$posts?_page=$page&_limit=${ApiConfig.itemPerPage}";
}
