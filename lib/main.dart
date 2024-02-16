import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_riverpod_mvc/product/init/application_initialize.dart';
import 'package:voco_riverpod_mvc/product/navigation/project_router.dart';
import 'package:voco_riverpod_mvc/product/theme/project_theme.dart';

Future<void> main() async {
  /// Start platform API's
  WidgetsFlutterBinding.ensureInitialized();
  await ApplicationInitialize().start();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final _appRouter = ProjectRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      title: 'Flutter Demo',
      theme:  ProjectTheme.themeDataLight(),
      darkTheme: ProjectTheme.themeDataDark(),
    );
  }
}
