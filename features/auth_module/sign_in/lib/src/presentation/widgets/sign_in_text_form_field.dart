import 'package:core/core.dart';
import 'package:flutter/material.dart';

class SignInTextFormField extends StatelessWidget {
  final TextEditingController _userNameController;
  final FocusNode _userNameFocusNode;

  final String _text;
  final IconButton? _suffixIcon;
  final String? Function(String?)? _validator;
  final bool _obscureText;
  final TextInputType? _textInputType;
  final dynamic Function(String)? _onSubmitted;
  final double _width;
  final double _heigth;
  final TextInputAction? _textInputAction;
  final Color? _fillColor;

  const SignInTextFormField({
    Key? key,
    required TextEditingController userNameController,
    required FocusNode userNameFocusNode,
    required String text,
    IconButton? suffixAction,
    TextInputType? textInputType,
    bool obscureText = false,
    dynamic Function(String)? onSubmitted,
    required double width,
    required double heigth,
    required String? Function(String?)? validator,
    TextInputAction? textInputAction,
    Color? fillColor,
  })  : _userNameController = userNameController,
        _userNameFocusNode = userNameFocusNode,
        _textInputType = textInputType,
        _text = text,
        _onSubmitted = onSubmitted,
        _validator = validator,
        _obscureText = obscureText,
        _suffixIcon = suffixAction,
        _width = width,
        _heigth = heigth,
        _textInputAction = textInputAction,
        _fillColor = fillColor,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: _width,
        height: _heigth,
      ),
      child: CustomTextFormField(
        textInputType: _textInputType,
        controller: _userNameController,
        focusNode: _userNameFocusNode,
        textStyle: const TextStyle(
          fontSize: 20,
        ),
        obscureText: _obscureText,
        onSubmitted: _onSubmitted,
        textInputAction: _textInputAction,
        inputDecoration: InputDecoration(
          labelText: _text,
          errorMaxLines: 2,
          iconColor: Colors.black,
          suffixIcon: _suffixIcon,
          errorStyle: const TextStyle(
            fontSize: 10,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          enabledBorder: _outlineInputBorder(Colors.black),
          focusedBorder: _outlineInputBorder(Colors.blueAccent),
          fillColor: _fillColor,
          filled: true,
        ),
        validator: _validator,
      ),
    );
  }
}

_outlineInputBorder(Color color) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: color,
    ),
  );
}
