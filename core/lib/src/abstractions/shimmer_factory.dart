import 'package:flutter/cupertino.dart';

abstract class ShimmerFactory {
  Widget create(
    BuildContext context,
    Widget child,
  );
}
