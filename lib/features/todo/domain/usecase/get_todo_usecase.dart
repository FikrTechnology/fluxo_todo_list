// 3. Setelah membuat repository, kita perlu membuat usecase untuk mengelola logika bisnis dari todo list. 
//    Use case ini akan berfungsi sebagai antarmuka antara UI dan repository, 
//    memungkinkan kita untuk menjalankan operasi yang terkait dengan todo list dengan cara yang terstruktur.


import 'package:dartz/dartz.dart';
import 'package:fluxo_todo_list/features/todo/domain/entities/todo_entity.dart';
import 'package:fluxo_todo_list/features/todo/domain/repositories/todo_repository.dart';

class GetTodoUsecase {
  final TodoRepository repository;

  GetTodoUsecase(this.repository);

  Future<Either<String, List<TodoEntity>>> call() async {
    return await repository.getListTodo();
  }
}