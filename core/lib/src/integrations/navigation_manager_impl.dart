import 'package:core/src/abstractions/navigation_manager.dart';
import 'package:flutter/material.dart';

class NavigationManagerImpl implements NavigationManager {
  @override
  Future<T?> navigateTo<T>(
    BuildContext context,
    String route,
  ) {
    return Navigator.of(context).pushNamed(route);
  }

  @override
  Future<T?> navigateToWithArgs<T, TArgs>(
    BuildContext context,
    String route,
    TArgs? args,
  ) {
    return Navigator.of(context).pushNamed(
      route,
      arguments: args,
    );
  }

  @override
  Future<T?> pushNamedAndRemoveUntil<T, TArgs>(
    BuildContext context,
    String route,
    RoutePredicate predicate, {
    TArgs? args,
  }) {
    return Navigator.of(context).pushNamedAndRemoveUntil(
      route,
      predicate,
      arguments: args,
    );
  }

  @override
  Future<T?> transitionPushTo<T, TArgs>(
    BuildContext context,
    Widget page,
    TArgs? args,
  ) {
    return Navigator.of(context).push(PageRouteBuilder<T>(
      pageBuilder: (c, a1, a2) => page,
      transitionsBuilder: (c, anim, a2, child) =>
          FadeTransition(opacity: anim, child: child),
      transitionDuration: const Duration(milliseconds: 500),
    ));
  }

  @override
  Future<T?> transitionReplaceTo<T, TArgs>(
    BuildContext context,
    Widget page,
    TArgs? args,
  ) {
    return Navigator.of(context).pushAndRemoveUntil(
      PageRouteBuilder<T>(
        pageBuilder: (c, a1, a2) => page,
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: const Duration(milliseconds: 500),
      ),
      (_) => false,
    );
  }
}
