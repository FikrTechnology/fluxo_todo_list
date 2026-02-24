import 'package:dartz/dartz.dart';
import 'package:fluxo_todo_list/features/todo/domain/repositories/todo_repository.dart';

class DeleteTodoUsecase {
  final TodoRepository repository;

  DeleteTodoUsecase(this.repository);

  Future<Either<String, Unit>> call(int id) async {
    return await repository.deleteTodo(id);
  }
}