import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluxo_todo_list/features/todo/domain/entities/todo_entity.dart';
import 'package:fluxo_todo_list/features/todo/domain/usecase/create_todo_usecase.dart';
import 'package:fluxo_todo_list/features/todo/domain/usecase/get_todo_usecase.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetTodoUsecase getTodoUsecase;
  final CreateTodoUsecase createTodoUsecase;

  TodoBloc({
    required this.getTodoUsecase,
    required this.createTodoUsecase
  }) : super(TodoInitial()) {
    on<FetchTodoEvent>(_onFetchTodo);
    on<CreateTodoEvent>(_onCreateTodo);
  }

  Future<void> _onFetchTodo(FetchTodoEvent event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    final result = await getTodoUsecase();
    result.fold(
      (failure) => emit(TodoError(failure)),
      (todos) => emit(TodoLoaded(todos)),
    );
  }

  Future<void> _onCreateTodo(CreateTodoEvent event, Emitter<TodoState> emit) async {
    final result = await createTodoUsecase(event.todo);
    result.fold(
      (failure) => emit(TodoError(failure)), 
      (_) => emit(TodoLoaded((state as TodoLoaded).todos..add(event.todo)))
    );
  }
}
