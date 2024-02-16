import 'package:flutter/foundation.dart';
import 'package:voco_riverpod_mvc/product/init/config/prod_env.dart';

import 'app_configuration.dart';
import 'dev_env.dart';

final class AppEnvironment {
  AppEnvironment.setup({required AppConfiguration appConfiguration}) {
    _config = appConfiguration;
  }

  AppEnvironment.general() {
    if (kDebugMode) _config = DevEnv();
    _config = ProdEnv();
  }

  static late AppConfiguration _config;
}

enum AppEnvironmentsItems {
  baseUrl;

  String get value {
    try {
      switch (this) {
        case AppEnvironmentsItems.baseUrl:
          return AppEnvironment._config.baseUrl;
      }
    } catch (e) {
      throw Exception("EnvironmentsItems: $e");
    }
  }
}
