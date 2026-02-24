// 8. Pada file `lib/core/injection_container.dart`, buatlah sebuah fungsi `init()` 
//  yang akan menginisialisasi semua dependency injection. pada fungsi ini, kita akan 
//  mendaftarkan semua repository, datasource, dan juga API client yang akan digunakan 
//  dalam aplikasi. Berikut adalah contoh implementasinya:

import 'package:dio/dio.dart';
import 'package:fluxo_todo_list/core/network/api_client.dart';
import 'package:fluxo_todo_list/features/todo/data/datasources/todo_remote_datasource.dart';
import 'package:fluxo_todo_list/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:fluxo_todo_list/features/todo/domain/repositories/todo_repository.dart';
import 'package:fluxo_todo_list/features/todo/domain/usecase/create_todo_usecase.dart';
import 'package:fluxo_todo_list/features/todo/domain/usecase/delete_todo_usecase.dart';
import 'package:fluxo_todo_list/features/todo/domain/usecase/get_detail_todo_usecase.dart';
import 'package:fluxo_todo_list/features/todo/domain/usecase/get_todo_usecase.dart';
import 'package:fluxo_todo_list/features/todo/domain/usecase/update_todo_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - Todo
  // Blocs
  // sl.registerFactory();

  // User cases
  sl.registerLazySingleton(() => GetTodoUsecase(sl()));
  sl.registerLazySingleton(() => GetDetailTodoUsecase(sl()));
  sl.registerLazySingleton(() => CreateTodoUsecase(sl()));
  sl.registerLazySingleton(() => UpdateTodoUsecase(sl()));
  sl.registerLazySingleton(() => DeleteTodoUsecase(sl()));

  // Repository
  sl.registerLazySingleton<TodoRepository>(
    () => TodoRepositoryImpl(remoteDatasource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<TodoRemoteDatasource>(
    () => TodoRemoteDatasourceImpl(dio: sl()),
  );

  // Core
  sl.registerLazySingleton<ApiClient>(() => ApiClient());
  sl.registerLazySingleton<Dio>(() => sl<ApiClient>().dio);

  
}