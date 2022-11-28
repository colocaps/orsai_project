import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String _label;
  final VoidCallback _onTap;
  final TextStyle? _textStyle;
  final ButtonStyle? _buttonStyle;
  final FocusNode? _focusNode;

  const CustomElevatedButton(
      {Key? key,
      required String label,
      required VoidCallback onTap,
      ButtonStyle? buttonStyle,
      FocusNode? focusNode,
      TextStyle? textStyle})
      : _label = label,
        _onTap = onTap,
        _focusNode = focusNode,
        _textStyle = textStyle,
        _buttonStyle = buttonStyle,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onTap,
      focusNode: _focusNode,
      style: _buttonStyle,
      child: Text(
        _label,
        style: _textStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
