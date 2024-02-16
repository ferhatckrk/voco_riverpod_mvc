import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_riverpod_mvc/features/auth/login/controller/login_controller.dart';
import 'package:voco_riverpod_mvc/features/home/participants/controller/participants_controller.dart';
import 'package:voco_riverpod_mvc/product/di/project_service_locater.dart';
import 'package:voco_riverpod_mvc/product/repository/local/local_storage_token.dart';
import 'package:voco_riverpod_mvc/product/repository/remote/auth/auth_repository.dart';
import 'package:voco_riverpod_mvc/product/repository/remote/home/user_repository.dart';
import 'package:voco_riverpod_mvc/product/utilities/enum/project_enums.dart';

/// --------------Contoller
/// login controller
final loginControllerProvider =
    StateNotifierProvider<LoginController, ProjectState>(
  (ref) => LoginController(
      authRepository: ServiceLocater.read<AuthRepository>(),
      localStorageToken: ServiceLocater.read<LocalStorageToken>()),
);

/// participants controller
final participantsControllerProvider =
    StateNotifierProvider<ParticipantsController, ProjectState>(
  (ref) => ParticipantsController(
    ServiceLocater.read<UserRepository>(),
  ),
);
