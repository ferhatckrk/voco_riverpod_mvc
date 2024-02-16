import 'package:dio/dio.dart';
import 'package:voco_riverpod_mvc/product/network/interceptors.dart';

import '../init/config/app_environments.dart';

class ProjectNetworkManager {
  late final Dio _service;
  ProjectNetworkManager._() {
    _service = Dio(BaseOptions(baseUrl: AppEnvironmentsItems.baseUrl.value));

    _service.interceptors.add(DioInterceptor());
  }

  static ProjectNetworkManager instance = ProjectNetworkManager._();

  Dio get service => _service;
}
