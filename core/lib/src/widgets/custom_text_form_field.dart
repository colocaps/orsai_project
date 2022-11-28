import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController _controller;
  final FocusNode _focusNode;
  final InputDecoration? _inputDecoration;
  final bool _obscureText;
  final TextStyle? _textStyle;
  final TextInputType? _textInputType;
  final Function(String)? _onSubmitted;
  final TextInputAction? _textInputAction;
  final String? _initialValue;
  final void Function(String)? _onChanged;
  final String? Function(String?)? _validator;

  const CustomTextFormField({
    Key? key,
    required TextEditingController controller,
    required FocusNode focusNode,
    Function(String)? onSubmitted,
    Icon? icon,
    InputDecoration? inputDecoration,
    bool obscureText = false,
    TextStyle? textStyle,
    TextInputType? textInputType,
    TextInputAction? textInputAction,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
    String? onError,
    String? initialValue,
    String? labelText,
  })  : _controller = controller,
        _focusNode = focusNode,
        _inputDecoration = inputDecoration,
        _obscureText = obscureText,
        _textStyle = textStyle,
        _textInputType = textInputType,
        _onSubmitted = onSubmitted,
        _textInputAction = textInputAction,
        _initialValue = initialValue,
        _onChanged = onChanged,
        _validator = validator,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      focusNode: _focusNode,
      decoration: _inputDecoration,
      obscureText: _obscureText,
      style: _textStyle,
      keyboardType: _textInputType,
      onFieldSubmitted: _onSubmitted,
      textInputAction: _textInputAction,
      initialValue: _initialValue,
      onChanged: _onChanged,
      validator: _validator,
    );
  }
}
