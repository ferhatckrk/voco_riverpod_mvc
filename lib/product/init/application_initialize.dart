import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:kartal/kartal.dart';
import 'package:logger/logger.dart';

import '../di/project_service_locater.dart';
import '../network/project_http_overrides.dart';
import 'config/app_environments.dart';

@immutable

/// App Başlatılmadan önce init edicekleri barındıran sınıf
final class ApplicationInitialize {
  /// Start project initiailze
  Future<void> start() async {
    await runZonedGuarded<Future<void>>(_initialize, (error, stack) {
      Logger().e(error.toString());
    });
  }

  Future<void> _initialize() async {
    /// Set device orientation
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await DeviceUtility.instance.initPackageInfo();

    FlutterError.onError = (details) {
      Logger().e(details.exceptionAsString(), error: details.exception);
    };

    // Certifica
    HttpOverrides.global = MyHttpOverrides();

    /// Setup env
    AppEnvironment.general();

    /// Start di
    ServiceLocater.setup();
  }
}
