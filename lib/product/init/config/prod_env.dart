import 'package:envied/envied.dart';
import 'package:voco_riverpod_mvc/product/init/config/app_configuration.dart';

part 'prod_env.g.dart';

@Envied(path: 'assets/env/.prod.env', obfuscate: true)
final class ProdEnv implements AppConfiguration {
  @EnviedField(varName: "BASE_URL")
  final String _baseUrl = _ProdEnv._baseUrl;

  @override
  String get baseUrl => _baseUrl;
}
