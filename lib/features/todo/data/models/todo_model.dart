// 4. Setelah membuat entity dan repository, kita perlu membuat model untuk mengubah data dari API ke entity. 
//    Model ini akan berfungsi sebagai antarmuka antara data API dan entity yang sudah dibuat sebelumnya.

import 'package:equatable/equatable.dart';
import 'package:fluxo_todo_list/features/todo/domain/entities/todo_entity.dart';

class TodoModel extends Equatable implements TodoEntity {
  @override
  final int id;
  @override
  final String title;
  @override
  final String category;
  @override
  final String description;
  @override
  final DateTime activityDate;
  @override
  final String status;
  @override
  final DateTime createdAt;

  TodoModel({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.activityDate,
    required this.status,
    required this.createdAt,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'] as int,
      title: json['title'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      activityDate: DateTime.parse(json['activity_date'] as String),
      status: json['status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'description': description,
      'activity_date': activityDate.toIso8601String(),
      'status': status,
      'created_at': createdAt.toIso8601String(),
    };
  }

  // Map ke domain entity
  @override
  TodoEntity toEntity() => TodoEntity(
    id: id, 
    title: title, 
    category: category, 
    description: description, 
    activityDate: activityDate, 
    status: status, 
    createdAt: createdAt
  );

  // Map dari domain entity
  TodoModel copyWith({
    int? id,
    String? title,
    String? category,
    String? description,
    DateTime? activityDate,
    String? status,
    DateTime? createdAt,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      description: description ?? this.description,
      activityDate: activityDate ?? this.activityDate,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  // Factory dari Entity (untuk di pakai di repository impl)
  factory TodoModel.fromEntity(TodoEntity entity) {
    return TodoModel(
      id: entity.id,
      title: entity.title,
      category: entity.category,
      description: entity.description,
      activityDate: entity.activityDate,
      status: entity.status,
      createdAt: entity.createdAt,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    category,
    description,
    activityDate,
    status,
    createdAt
  ];
}