// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:dummy_api/dependencies.dart' as _i12;
import 'package:dummy_api/features/core/data/local/sqflite_database.dart'
    as _i4;
import 'package:dummy_api/features/initialization/cubit/initialization_cubit.dart'
    as _i3;
import 'package:dummy_api/features/posts/data/data_source/local/posts_local_data_source.dart'
    as _i7;
import 'package:dummy_api/features/posts/data/data_source/remote/posts_remote_data_source.dart'
    as _i6;
import 'package:dummy_api/features/posts/data/repository/posts_repository_impl.dart'
    as _i9;
import 'package:dummy_api/features/posts/domain/repository/product_repository.dart'
    as _i8;
import 'package:dummy_api/features/posts/domain/usecases/get_posts.dart'
    as _i10;
import 'package:dummy_api/features/posts/presentation/bloc/posts_bloc.dart'
    as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i3.InitializationCubit>(
        () => _i3.InitializationCubit(gh<_i4.SqfLiteDatabase>()));
    gh.factory<_i5.BaseOptions>(
      () => registerModule.baseOptions,
      instanceName: 'BaseOptions',
    );
    gh.lazySingleton<_i5.Dio>(() =>
        registerModule.dio(gh<_i5.BaseOptions>(instanceName: 'BaseOptions')));
    gh.singleton<_i6.PostsRemoteDataSourceImpl>(
        _i6.PostsRemoteDataSourceImpl(gh<_i5.Dio>()));
    gh.lazySingleton<_i4.SqfLiteDatabase>(() => registerModule.sqfLiteDatabase);
    gh.singleton<_i7.PostsLocalDataSource>(
        _i7.PostsLocalDataSourceImpl(gh<_i4.SqfLiteDatabase>()));
    gh.factory<_i8.PostsRepository>(() => _i9.PostsRepositoryImpl(
          gh<_i6.PostsRemoteDataSource>(),
          gh<_i7.PostsLocalDataSource>(),
        ));
    gh.singleton<_i10.GetPosts>(_i10.GetPosts(gh<_i8.PostsRepository>()));
    gh.factory<_i11.PostsBloc>(() => _i11.PostsBloc(gh<_i10.GetPosts>()));
    return this;
  }
}

class _$RegisterModule extends _i12.RegisterModule {}
