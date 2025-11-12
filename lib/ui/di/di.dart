import 'package:dio/dio.dart';
import 'package:doit_app/data/datasource/local_datasource.dart';
import 'package:doit_app/data/repository/api_repository.dart';
import 'package:doit_app/data/repository/db_repository.dart';
import 'package:doit_app/data/repository_impl/api_repository_impl.dart';
import 'package:doit_app/data/repository_impl/db_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';

import '../../data/database/database_helper.dart';
import '../home/contract/state/home_state.dart';
import '../home/contract/state/todo.dart';
import '../home/view/widgets/bottom_sheet/bottom_sheet_provider.dart';
import '../home/view_model/home_view_model.dart';

final homeViewModelProvider = AsyncNotifierProvider<HomeViewModel, HomeState>(
  HomeViewModel.new,
);

final bottomSheetProvider =
    NotifierProvider.autoDispose<BottomSheetNotifier, TodoModel>(
      BottomSheetNotifier.new,
    );

final databaseProvider = FutureProvider<Database>((ref) {
  return DatabaseHelper.instance.database;
});

final localDataSourceProvider = FutureProvider<LocalDatasource>((ref) async {
  final Database db = await ref.watch(databaseProvider.future);
  return LocalDatasource(db);
});

final dbRepositoryProvider = FutureProvider<DBRepository>((ref) async {
  final datasource = await ref.watch(localDataSourceProvider.future);
  return DBRepositoryImpl(datasource);
});

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(baseUrl: 'https://openapi.naver.com'));
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers.addAll({
          'X-Naver-Client-Id': 'UeAA6Pxa9l0m9tgyDRbN',
          'X-Naver-Client-Secret': '7OiqabezBO',
        });
        return handler.next(options);
      },
    ),
  );
  return dio;
});

final apiRepositoryProvider = Provider<ApiRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return ApiRepositoryImpl(dio);
});
