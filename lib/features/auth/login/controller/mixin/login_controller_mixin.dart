import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_riverpod_mvc/product/utilities/enum/project_enums.dart';

import '../../../../../product/widget/snack_bar/project_snackbar.dart';

mixin LoginControllerMixin on StateNotifier<ProjectState> {
  /// Check the information entered by the user
  /// !Returns true if OK, otherwise false
  bool validateUserInput(String email, String password, BuildContext context) {
    if (email.isEmpty) {
      projectShowSnackBar(
          context: context, message: "Email is a required field");
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
}
