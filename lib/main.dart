import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_riverpod_mvc/features/auth/login/view/login_view.dart';
import 'package:voco_riverpod_mvc/features/home/participants/view/participants_view.dart';
import 'package:voco_riverpod_mvc/product/di/project_service_locater.dart';
import 'package:voco_riverpod_mvc/product/init/application_initialize.dart';
import 'package:voco_riverpod_mvc/product/init/theme/project_theme.dart';
import 'package:voco_riverpod_mvc/product/navigation/project_router.dart';
import 'package:voco_riverpod_mvc/product/repository/local/local_storage_token.dart';

Future<void> main() async {
  /// Start platform API's
  WidgetsFlutterBinding.ensureInitialized();
  await ApplicationInitialize().start();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ProjectTheme.themeDataLight(),
       
      onGenerateRoute: (setting) => ProjectProuter.generateRoute(setting),
      home: FutureBuilder<String>(
          future: ServiceLocater.read<LocalStorageToken>().getToken(),
          builder: (_, snap) {
            if (snap.connectionState == ConnectionState.done) {
              return snap.data!.isNotEmpty
                  ? const ParticipantsView()
                  : const LoginView();
            }
            return const SizedBox();
          }),
    );
  }
}
