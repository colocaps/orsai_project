import 'package:flutter/material.dart';

class CustomPopupMenuButton extends StatelessWidget {
  final List<PopupMenuEntry<dynamic>> Function(BuildContext) _itemBuilder;
  final dynamic _initialValue;
  final void Function(dynamic)? _onSelected;
  final void Function()? _onCanceled;
  final String? _tooltip;
  final double? _elevation;
  final EdgeInsetsGeometry _padding;
  final Widget? _child;
  final Icon? _icon;
  final double? _iconSize;
  final Offset _offset;
  final bool _enabled;
  final ShapeBorder? _shape;

  const CustomPopupMenuButton({
    Key? key,
    required List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder,
    dynamic initialValue,
    void Function(dynamic)? onSelected,
    void Function()? onCanceled,
    String? tooltip,
    double? elevation,
    EdgeInsetsGeometry padding = const EdgeInsets.all(8.0),
    Widget? child,
    Icon? icon,
    double? iconSize,
    Offset offset = Offset.zero,
    bool enabled = true,
    ShapeBorder? shape,
  })  : _itemBuilder = itemBuilder,
        _initialValue = initialValue,
        _onSelected = onSelected,
        _onCanceled = onCanceled,
        _tooltip = tooltip,
        _elevation = elevation,
        _padding = padding,
        _child = child,
        _icon = icon,
        _iconSize = iconSize,
        _offset = offset,
        _enabled = enabled,
        _shape = shape,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: _itemBuilder,
      initialValue: _initialValue,
      onSelected: _onSelected,
      onCanceled: _onCanceled,
      tooltip: _tooltip,
      elevation: _elevation,
      padding: _padding,
      icon: _icon,
      iconSize: _iconSize,
      offset: _offset,
      enabled: _enabled,
      shape: _shape,
      child: _child,
    );
  }
}
