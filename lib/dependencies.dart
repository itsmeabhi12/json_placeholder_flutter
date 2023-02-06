import 'package:dio/dio.dart';
import 'package:dummy_api/dependencies.config.dart';
import 'package:dummy_api/features/core/data/local/response_header_cache.dart';
import 'package:dummy_api/features/core/data/local/sqflite_database.dart';
import 'package:dummy_api/features/core/data/remote/etag_interceptor.dart';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@injectableInit
void configureDependencies() => getIt.init();

@module
abstract class RegisterModule {
  @Named('BaseOptions')
  BaseOptions get baseOptions => BaseOptions(
        validateStatus: (status) =>
            status != null && status >= 200 && status < 400,
      );
  @lazySingleton
  Dio dio(@Named('BaseOptions') BaseOptions baseOptions) => Dio(baseOptions)
    ..interceptors.add(ETagInterceptor(ResponseHeaderCache()));

  @lazySingleton
  SqfLiteDatabase get sqfLiteDatabase => SqfLiteDatabase();
}
