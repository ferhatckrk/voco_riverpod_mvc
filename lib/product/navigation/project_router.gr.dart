// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'project_router.dart';

abstract class _$ProjectRouter extends RootStackRouter {
  // ignore: unused_element
  _$ProjectRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginView(),
      );
    },
    ParticipantsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child:   ParticipantsView(),
      );
    },
  };
}

/// generated route for
/// [LoginView]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ParticipantsView]
class ParticipantsRoute extends PageRouteInfo<void> {
  const ParticipantsRoute({List<PageRouteInfo>? children})
      : super(
          ParticipantsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ParticipantsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
