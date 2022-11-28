import 'package:flutter/material.dart';

abstract class NavigationManager {
  Future<T?> navigateTo<T>(BuildContext context, String route);

  Future<T?> navigateToWithArgs<T, TArgs>(
    BuildContext context,
    String route,
    TArgs? args,
  );

  Future<T?> pushNamedAndRemoveUntil<T, TArgs>(
    BuildContext context,
    String route,
    RoutePredicate predicate, {
    TArgs? args,
  });

  Future<T?> transitionPushTo<T, TArgs>(
    BuildContext context,
    Widget page,
    TArgs? args,
  );

  Future<T?> transitionReplaceTo<T, TArgs>(
    BuildContext context,
    Widget page,
    TArgs? args,
  );
}
