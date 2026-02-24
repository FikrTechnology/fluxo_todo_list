// 6. Pada file `lib/features/todo/data/datasources/todo_remote_datasource.dart`, 
//  buatlah sebuah class `TodoRemoteDataSource` yang akan bertanggung jawab untuk mengambil 
//  data todo dari API. Berikut adalah contoh implementasinya:

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fluxo_todo_list/features/todo/data/models/todo_model.dart';

abstract class TodoRemoteDatasource {
  Future<List<TodoModel>> getTodos();
  Future<TodoModel> getTodoDetail(int id);
  Future<Unit> createTodo(TodoModel todo);
  Future<Unit> updateTodo(TodoModel todo);
  Future<Unit> deleteTodo(int id);
}

class TodoRemoteDatasourceImpl implements TodoRemoteDatasource {
  final Dio dio;
  
  TodoRemoteDatasourceImpl({required this.dio});

  @override
  Future<List<TodoModel>> getTodos() async {
    try {
      final response = await dio.get('/activities');

      if (response.statusCode == 200) {
        final data = response.data as List;
        return data
          .map((json) => TodoModel.fromJson(json as Map<String, dynamic>))
          .toList();
      } else {
        throw Exception('Failed to load todos');
      }
    } catch (_) {
      throw Exception('Failed to load todos');
    }
  }

  @override
  Future<TodoModel> getTodoDetail(int id) async {
    try {
      final response = await dio.get('/activities/$id');

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        return TodoModel.fromJson(data);
      } else {
        throw Exception('Failed to load todo detail');
      }
    } catch (_) {
      throw Exception('Failed to load todo detail');
    }
  }

  @override
  Future<Unit> createTodo(TodoModel todo) async {
    try {
      final response = await dio.post('/activities', data: todo.toJson());

      if (response.statusCode == 201) {
        return unit;
      } else {
        throw Exception('Failed to create todo');
      }
    } catch (_) {
      throw Exception('Failed to create todo');
    }
  }

  @override
  Future<Unit> updateTodo(TodoModel todo) async {
    try {
      final response = await dio.put('/actiivities/${todo.id}', data: todo.toJson());

      if (response.statusCode == 200) {
        return unit;
      } else {
        throw Exception('Failed to update todo');
      }
    } catch (_) {
      throw Exception('Failed to update todo');
    }
  }

  @override
  Future<Unit> deleteTodo(int id) async {
    try {
      await dio.delete('/activities/$id');
      return unit;
    } catch (_) {
      throw Exception('Failed to delete todo');
    }
  }
}