import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_riverpod_mvc/features/auth/login/controller/login_controller.dart';
import 'package:voco_riverpod_mvc/features/auth/login/view/login_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:voco_riverpod_mvc/product/navigation/project_router.dart';

mixin LoginViewMixin on ConsumerState<LoginView> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  login() {
    ref.read(loginControllerProvider.notifier).login(
        email: emailController.text.toLowerCase().trim(),
        password: passwordController.text,
        context: context);
  }
}
