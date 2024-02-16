import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:voco_riverpod_mvc/product/di/project_service_locater.dart';
import 'package:voco_riverpod_mvc/product/model/auth/login/login_request_model.dart';
import 'package:voco_riverpod_mvc/product/repository/local/local_storage_token.dart';
import 'package:voco_riverpod_mvc/product/repository/remote/auth/auth_repository.dart';
import 'package:voco_riverpod_mvc/product/widget/snack_bar/project_snackbar.dart';
import 'package:auto_route/auto_route.dart';

import '../../../../product/model/auth/token/token_model.dart';
import '../../../../product/navigation/project_router.dart';
import '../../../../product/utilities/enum/project_enums.dart';

final loginControllerProvider =
    StateNotifierProvider<LoginController, ProjectState>(
  (ref) => LoginController(
      authRepository: ServiceLocater.read<AuthRepository>(),
      localStorageToken: ServiceLocater.read<LocalStorageToken>()),
);

class LoginController extends StateNotifier<ProjectState> {
  final AuthRepository _authRepository;
  final LocalStorageToken _localStorageToken;
  LoginController(
      {required AuthRepository authRepository,
      required LocalStorageToken localStorageToken})
      : _authRepository = authRepository,
        _localStorageToken = localStorageToken,
        super(ProjectState.initial);

  /// Send API login request
  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    if (_validateUserInput(email, password, context)) {
      final LoginRequestModel loginRequestModel =
          LoginRequestModel(email: email, password: password);
      state = ProjectState.loading;
      // request / result
      final result = await _authRepository.login(loginRequestModel);

      result.fold((serviceError) {
        // failure

        state = ProjectState.error;
        projectShowSnackBar(
            context: context, message: serviceError.errorMessage);
      }, (token) async {
        //Success
        await _saveToken(token);
        state = ProjectState.success;
        if (mounted) {
          _navigateToParticipantsView(context);
        }
      });
    }
  }

  Future<void> _saveToken(TokenModel tokenModel) async {
    await _localStorageToken.setToken(tokenModel);
  }
}

_navigateToParticipantsView(BuildContext context) {
  context.router.push(const ParticipantsRoute());
}

/// Check the information entered by the user
/// !Returns true if OK, otherwise false
bool _validateUserInput(String email, String password, BuildContext context) {
  if (email.isEmpty) {
    projectShowSnackBar(context: context, message: "Email is a required field");
    return false;
  } else if (!EmailValidator.validate(email)) {
    projectShowSnackBar(
        context: context,
        message: "Please enter a valid email",
        type: EnumSnackBarType.error);
    return false;
  } else if (password.isEmpty) {
    projectShowSnackBar(
        context: context,
        message: "Please enter a valid password",
        type: EnumSnackBarType.error);
    return false;
  } else if (password.length < 6) {
    projectShowSnackBar(
        context: context,
        message: "Password must be at least 6 digits",
        type: EnumSnackBarType.error);
    return false;
  }
  return true;
}
