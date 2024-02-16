import 'package:flutter/material.dart';
import 'package:voco_riverpod_mvc/product/utilities/enum/project_enums.dart';

void projectShowSnackBar(
    {required BuildContext context,
    required String message,
    SnackBarAction? action,
    EnumSnackBarType? type = EnumSnackBarType.message}) {
  FocusScope.of(context).unfocus();
  ScaffoldMessenger.of(context)
      .showSnackBar(_snackBar(message, action, type, context));
}

SnackBar _snackBar(String message, SnackBarAction? action,
    EnumSnackBarType? type, BuildContext context) {
  switch (type) {
    case EnumSnackBarType.message:
      return SnackBar(
          action: action,
          content: Text(message,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white)));
    case EnumSnackBarType.success:
      return SnackBar(
          backgroundColor: Colors.green,
          action: action,
          content: Text(message,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white)));
    case EnumSnackBarType.error:
      return SnackBar(
          backgroundColor: Colors.red,
          action: action,
          content: Text(
            message,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ));

    default:
      return SnackBar(
          backgroundColor: Colors.green,
          action: action,
          content: Text(message,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white)));
  }
}
