import 'package:dummy_api/features/core/data/local/hive_database.dart';
import 'package:dummy_api/features/core/data/model/response_header.dart';
import 'package:hive/hive.dart';

class ResponseHeaderCache {
  Future<void> saveHeader(ResponseHeader responseHeader) async {
    final headerBox = Hive.box(HiveDatabase.headersBox);
    await headerBox.put(
      responseHeader.requestUrl,
      responseHeader.eTag,
    );
  }

  String? getETag(String url) {
    final headerBox = Hive.box(HiveDatabase.headersBox);
    return headerBox.get(url);
  }
}
