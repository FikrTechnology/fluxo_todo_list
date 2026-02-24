import 'package:dartz/dartz.dart';
import 'package:fluxo_todo_list/features/todo/domain/entities/todo_entity.dart';
import 'package:fluxo_todo_list/features/todo/domain/repositories/todo_repository.dart';

class UpdateTodoUsecase {
  final TodoRepository repository;

  UpdateTodoUsecase(this.repository);

  Future<Either<String, Unit>> call(TodoEntity todo) async {
    return await repository.updateTodo(todo);
  }
}