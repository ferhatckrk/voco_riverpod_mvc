import 'package:voco_riverpod_mvc/product/network/project_network_manager.dart';
import 'package:voco_riverpod_mvc/product/repository/local/local_storage_token.dart';
import 'package:voco_riverpod_mvc/product/repository/remote/auth/auth_repository.dart';

import 'project_service_locater.dart';

class ProjectServiceItems {
  ProjectServiceItems._();

  static ProjectNetworkManager get projectServiceManager =>
      ServiceLocater.read<ProjectNetworkManager>();

  // --------------- Repository-----------------
  // Auth Repository
  static AuthRepository get authRepository =>
      ServiceLocater.read<AuthRepository>();

  // LocalData Repository

  static LocalStorageToken get tokenLocalStorage =>
      ServiceLocater.read<LocalStorageToken>();
}
