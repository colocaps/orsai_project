import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:orsai_project/features/auth_module/pages/sign_in_page.dart';
import 'package:orsai_project/features/home_module/pages/home_page.dart';

abstract class AuthModule {
  static late final NavigationManager _navigationManager;

  static registerDependencies() async {
    _navigationManager =
        InjectorContainer.instance.resolve<NavigationManager>();
  }

  static const String signInRoute = '/sign-in';
  static const String homeRoute = '/';

  static Map<String, WidgetBuilder> generateRoutes() {
    return {
      signInRoute: (context) => const SignInPage(),
      homeRoute: (context) => const HomePage(),
    };
  }

  static Future<T?> navigateToSignIn<T, TArgs>(
    BuildContext context,
    TArgs args,
  ) {
    return _navigationManager.navigateToWithArgs(
      context,
      signInRoute,
      args,
    );
  }

  static Future<T?> navigateToHome<T, TArgs>(
    BuildContext context,
    TArgs? args,
  ) {
    return _navigationManager.navigateToWithArgs(
      context,
      homeRoute,
      args,
    );
  }
}
