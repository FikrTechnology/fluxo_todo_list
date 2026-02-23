// 1. Hal yang paling utama dalam membuat sebuah aplikasi adalah dengan 
//    membuat model atau entity yang akan digunakan untuk menyimpan data. 
//    Dalam kasus ini, kita akan membuat entity untuk menyimpan data todo list. 
//    Entity ini akan digunakan untuk menyimpan data yang didapat dari API atau 
//    database, dan juga untuk mengirim data ke API atau database.


class ListTodoEntity {
  final List<TodoEntity> listTodo;
  
  ListTodoEntity({
    required this.listTodo,
  });
}

class TodoEntity {
  final int id;
  final String title;
  final String category;
  final String description;
  final String activityDate;
  final String status;
  final String createdAt;

  TodoEntity({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.activityDate,
    required this.status,
    required this.createdAt,
  });
}