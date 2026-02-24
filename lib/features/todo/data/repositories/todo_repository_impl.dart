// 7. Pada file `lib/features/todo/data/repositories/todo_repository_impl.dart`, 
//  buatlah sebuah class `TodoRepositoryImpl` yang akan mengimplementasikan interface.
//  `TodoRepository` yang telah kita buat sebelumnya berfungsi untuk mengelola data todo 
//  list dengan menggunakan datasource yang sudah dibuat.
//  Repository ini akan menggunakan `TodoRemoteDataSource` untuk mengambil data dari API 
//  dan mengelola data tersebut sesuai dengan kebutuhan. Berikut adalah contoh implementasinya:

import 'package:dartz/dartz.dart';
import 'package:fluxo_todo_list/features/todo/data/datasources/todo_remote_datasource.dart';
import 'package:fluxo_todo_list/features/todo/data/models/todo_model.dart';
import 'package:fluxo_todo_list/features/todo/domain/entities/todo_entity.dart';
import 'package:fluxo_todo_list/features/todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDatasource remoteDatasource;

  TodoRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<String, List<TodoEntity>>> getListTodo() async {
    try {
      final remoteTodos = await remoteDatasource.getTodos();
      return Right(remoteTodos.map((model) => model.toEntity()).toList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, TodoEntity>> getDetailTodo(int id) async {
    try {
      final remoteTodo = await remoteDatasource.getTodoDetail(id);
      return Right(remoteTodo.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> createTodo(TodoEntity todo) async {
    final TodoModel model = TodoModel.fromEntity(todo);
    try {
      await remoteDatasource.createTodo(model);
      return const Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> updateTodo(TodoEntity todo) async {
    final TodoModel model = TodoModel.fromEntity(todo);

    try{
      await remoteDatasource.updateTodo(model);
      return const Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> deleteTodo(int id) async {
    try {
      await remoteDatasource.deleteTodo(id);
      return const Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
  }
}