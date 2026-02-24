

import 'package:dartz/dartz.dart';
import 'package:fluxo_todo_list/features/todo/domain/entities/todo_entity.dart';
import 'package:fluxo_todo_list/features/todo/domain/repositories/todo_repository.dart';

class GetDetailTodoUsecase {
  final TodoRepository repository;

  GetDetailTodoUsecase(this.repository);

  Future<Either<String, TodoEntity>> call(int id) async {
    return await repository.getDetailTodo(id);
  }
}