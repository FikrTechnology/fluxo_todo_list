// 2. Setelah membuat entity, kita perlu membuat repository untuk mengelola data todo list. 
//    Repository ini akan berfungsi sebagai antarmuka antara data dan aplikasi, 
//    memungkinkan kita untuk mengakses dan memanipulasi data todo list dengan cara yang terstruktur.

import 'package:dartz/dartz.dart';
import 'package:fluxo_todo_list/features/todo/domain/entities/todo_entity.dart';

abstract class TodoRepository {
  Future<Either<String, ListTodoEntity>> getListTodo();
  Future<Either<String, TodoEntity>> getDetailTodo(int id);
  Future<Either<String, Unit>> createTodo(TodoEntity todo);
  Future<Either<String, Unit>> updateTodo(TodoEntity todo);
  Future<Either<String, Unit>> deleteTodo(int id);
}
