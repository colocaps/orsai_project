import 'package:core/src/abstractions/shimmer_factory.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerFactoryImpl implements ShimmerFactory {
  @override
  Widget create(BuildContext context, Widget child) {
    if (kIsWeb) {
      return Opacity(
        opacity: 0.4,
        child: child,
      );
    }
    return Shimmer.fromColors(
      baseColor: Colors.black12,
      highlightColor: Colors.white12,
      child: child,
    );
  }
}
