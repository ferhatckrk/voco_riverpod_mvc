import 'package:dio/dio.dart';
import 'package:voco_riverpod_mvc/product/di/project_service_locater.dart';

import '../repository/local/local_storage_token.dart';

class DioInterceptor extends Interceptor {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await ServiceLocater.read<LocalStorageToken>().getToken();
    if (token.isNotEmpty) {
      options.headers['Authorization'] = "Bearer $token";
    }
    options.headers['Content-Type'] = "application/json";

    super.onRequest(options, handler);
  }
}
