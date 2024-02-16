import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:voco_riverpod_mvc/product/repository/local/local_storage_token.dart';
import 'package:voco_riverpod_mvc/product/repository/remote/auth/auth_repository.dart';

import '../network/project_network_manager.dart';

class ServiceLocater {
  ServiceLocater._();
  static final _getIt = GetIt.I;

  static void setup() {
    _getIt.registerSingleton<Dio>(ProjectNetworkManager.instance.service);
    // Repository

    // Auth Repository
    _getIt.registerLazySingleton(() => AuthRepository(_getIt()));

    // Login Repository
    _getIt.registerLazySingleton(() => LocalStorageToken());
  }

  static T read<T extends Object>() => _getIt<T>();
}
