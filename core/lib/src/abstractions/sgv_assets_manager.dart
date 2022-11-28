import 'package:flutter/material.dart';

abstract class SvgAssetsManager {
  dynamic svgPicture(
    final String asset,
    final Color color,
    final double? height,
    final double? width,
  );
}
