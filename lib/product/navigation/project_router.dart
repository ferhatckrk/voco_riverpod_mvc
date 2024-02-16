import 'package:auto_route/auto_route.dart';

import '../../features/auth/login/view/login_view.dart';
import '../../features/home/participants/view/participants_view.dart';

part 'project_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "View,Route")
final class ProjectRouter extends _$ProjectRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: ParticipantsRoute.page, initial: true),
      ];
}
