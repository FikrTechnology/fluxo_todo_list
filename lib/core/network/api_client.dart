// 5. Pada file `lib/core/network/api_client.dart`, buatlah sebuah class `ApiClient` 
//  yang akan bertanggung jawab untuk mengelola koneksi ke API. Berikut adalah contoh 
//  implementasinya:


import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  ApiClient() : dio = Dio(
    BaseOptions(
      baseUrl: 'https://ideal-ame-fikr-technology-2c247e23.koyeb.app',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    )
  );
}