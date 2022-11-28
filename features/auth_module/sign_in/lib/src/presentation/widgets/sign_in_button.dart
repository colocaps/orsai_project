import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in/src/presentation/cubit/sign_in_cubit.dart';

class SignInElevatedButton extends StatelessWidget {
  final String _buttonText;
  final ThemeData _theme;
  final TextEditingController _userNameController;
  final TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey;
  final FocusNode? _focusNode;
  final double _heigth;
  final double _width;
  final double _fontSize;
  const SignInElevatedButton({
    Key? key,
    required String buttonText,
    required ThemeData theme,
    required TextEditingController userNameController,
    required TextEditingController passwordController,
    required GlobalKey<FormState> formKey,
    required double heigth,
    required double width,
    required double fontSize,
    FocusNode? focusNode,
  })  : _buttonText = buttonText,
        _theme = theme,
        _focusNode = focusNode,
        _userNameController = userNameController,
        _passwordController = passwordController,
        _formKey = formKey,
        _width = width,
        _heigth = heigth,
        _fontSize = fontSize,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: _width,
        height: _heigth,
      ),
      child: CustomElevatedButton(
        label: _buttonText,
        focusNode: _focusNode,
        textStyle: _theme.textTheme.button!.copyWith(fontSize: _fontSize),
        buttonStyle: _theme.elevatedButtonTheme.style,
        onTap: () {
          final user = _userNameController.text.trim();
          final password = _passwordController.text.trim();

          FocusManager.instance.primaryFocus?.unfocus();
          if (_formKey.currentState!.validate()) {
            context.read<SignInCubit>().signIn(user, password);
          }
        },
      ),
    );
  }
}
