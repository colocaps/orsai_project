import 'package:flutter/material.dart';

class CustomPopMenuItem extends StatelessWidget {
  final dynamic _value;
  final void Function()? _onTap;
  final bool _enabled;
  final double _height;
  final EdgeInsets? _padding;
  final TextStyle? _textStyle;
  final MouseCursor? _mouseCursor;
  final Widget? _child;

  const CustomPopMenuItem({
    Key? key,
    dynamic value,
    void Function()? onTap,
    bool enabled = true,
    double height = kMinInteractiveDimension,
    EdgeInsets? padding,
    TextStyle? textStyle,
    MouseCursor? mouseCursor,
    required Widget? child,
  })  : _value = value,
        _onTap = onTap,
        _enabled = enabled,
        _height = height,
        _padding = padding,
        _textStyle = textStyle,
        _mouseCursor = mouseCursor,
        _child = child,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuItem<dynamic>(
      value: _value,
      onTap: _onTap,
      enabled: _enabled,
      height: _height,
      padding: _padding,
      textStyle: _textStyle,
      mouseCursor: _mouseCursor,
      child: _child,
    );
  }
}
