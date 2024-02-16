import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_riverpod_mvc/features/auth/login/view/mixin/login_view_mixin.dart';
import 'package:voco_riverpod_mvc/product/provider/providers.dart';
import 'package:voco_riverpod_mvc/product/utilities/enum/project_enums.dart';
import 'package:voco_riverpod_mvc/product/widget/button/project_button.dart';
import 'package:voco_riverpod_mvc/product/widget/component/project_component.dart';
import 'package:voco_riverpod_mvc/product/widget/textfield/project_textfield.dart';

@RoutePage()
class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> with LoginViewMixin {
  @override
  Widget build(
    BuildContext context,
  ) {
    final size = MediaQuery.sizeOf(context);
    final loginController = ref.watch(loginControllerProvider);
    return Scaffold(
      body: loginController == ProjectState.loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: SizedBox(
                height: size.height,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      addSpaceVertical(size.height * .3),
                      ProjectTextField(
                          controller: emailController, hintText: "Enter Your Email"),
                      addSpaceVertical(size.height * .01),
                      ProjectTextField(
                          controller: passwordController,
                          hintText: "Enter Your Password",
                          isPassword: true),
                      const Spacer(),
                      ProjectButton(
                        text: "Login",
                        function: login,
                      ),
                      addSpaceVertical(size.height * .1),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
