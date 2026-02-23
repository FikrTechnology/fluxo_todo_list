// 1. Hal yang paling utama dalam membuat sebuah aplikasi adalah dengan 
//    membuat model atau entity yang akan digunakan untuk menyimpan data. 
//    Dalam kasus ini, kita akan membuat entity untuk menyimpan data todo list. 
//    Entity ini akan digunakan untuk menyimpan data yang didapat dari API atau 
//    database, dan juga untuk mengirim data ke API atau database.


import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final int id;
  final String title;
  final String category;
  final String description;
  final DateTime activityDate;
  final String status;
  final DateTime createdAt;

  const TodoEntity({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.activityDate,
    required this.status,
    required this.createdAt,
  });

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