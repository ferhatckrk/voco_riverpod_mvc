import 'package:flutter/material.dart';
import 'package:voco_riverpod_mvc/features/auth/login/view/login_view.dart';
import 'package:voco_riverpod_mvc/features/home/participants/view/participants_view.dart';

class ProjectProuter {
  static dynamic generateRoute(RouteSettings routeSetting) {
    switch (routeSetting.name) {
      case LoginView.routeName:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );
      case ParticipantsView.routeName:
        return MaterialPageRoute(
          builder: (context) => const ParticipantsView(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
              body: Center(
            child: Text("Oops! \nPage Not Found."),
          )),
        );
    }
  }
}
