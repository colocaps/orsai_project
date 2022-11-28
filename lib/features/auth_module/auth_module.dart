import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:orsai_project/application/auth_module/pages/sign_in_page.dart';

abstract class AuthModule {
  static late final NavigationManager _navigationManager;

  static registerDependencies() async {
    _navigationManager =
        InjectorContainer.instance.resolve<NavigationManager>();
    // await HomeSearhcInitializer.registerDependencies();
  }

  static const String signInRoute = '/sign-in';

  static Map<String, WidgetBuilder> generateRoutes() {
    return {
      signInRoute: (context) => const SignInPage(),
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
}
