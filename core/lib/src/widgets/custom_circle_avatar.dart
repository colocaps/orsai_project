import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final Color? _backgroundColor;
  final ImageProvider<Object>? _backgroundImage;
  final ImageProvider<Object>? _foregroundImage;
  final void Function(Object, StackTrace?)? _onBackgroundImageError;
  final void Function(Object, StackTrace?)? _onForegroundImageError;
  final Color? _foregroundColor;
  final double? _radius;
  final double? _minRadius;
  final double? _maxRadius;
  final Widget? _child;

  const CustomCircleAvatar({
    Key? key,
    Color? backgroundColor,
    ImageProvider<Object>? backgroundImage,
    ImageProvider<Object>? foregroundImage,
    void Function(Object, StackTrace?)? onBackgroundImageError,
    void Function(Object, StackTrace?)? onForegroundImageError,
    Color? foregroundColor,
    double? radius,
    double? minRadius,
    double? maxRadius,
    Widget? child,
  })  : _backgroundColor = backgroundColor,
        _backgroundImage = backgroundImage,
        _foregroundImage = foregroundImage,
        _onBackgroundImageError = onBackgroundImageError,
        _onForegroundImageError = onForegroundImageError,
        _foregroundColor = foregroundColor,
        _radius = radius,
        _minRadius = minRadius,
        _maxRadius = maxRadius,
        _child = child,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: _backgroundColor,
      backgroundImage: _backgroundImage,
      foregroundImage: _foregroundImage,
      onBackgroundImageError: _onBackgroundImageError,
      onForegroundImageError: _onForegroundImageError,
      foregroundColor: _foregroundColor,
      radius: _radius,
      maxRadius: _maxRadius,
      minRadius: _minRadius,
      child: _child,
    );
  }
}
