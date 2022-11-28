import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color? _color;
  final Color? _shadowColor;
  final double? _elevation;
  final ShapeBorder? _shape;
  final bool _borderOnForeground;
  final EdgeInsetsGeometry? _margin;
  final Clip? _clipBehavior;
  final bool _semanticContainer;
  final Widget? _child;

  const CustomCard({
    Key? key,
    Color? color,
    Color? shadowColor,
    double? elevation,
    ShapeBorder? shape,
    bool borderOnForeground = true,
    EdgeInsetsGeometry? margin,
    Clip? clipBehavior,
    bool semanticContainer = true,
    Widget? child,
  })  : _color = color,
        _shadowColor = shadowColor,
        _elevation = elevation,
        _shape = shape,
        _borderOnForeground = borderOnForeground,
        _margin = margin,
        _clipBehavior = clipBehavior,
        _semanticContainer = semanticContainer,
        _child = child,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _color,
      shadowColor: _shadowColor,
      elevation: _elevation,
      shape: _shape,
      borderOnForeground: _borderOnForeground,
      margin: _margin,
      clipBehavior: _clipBehavior,
      semanticContainer: _semanticContainer,
      child: _child,
    );
  }
}
