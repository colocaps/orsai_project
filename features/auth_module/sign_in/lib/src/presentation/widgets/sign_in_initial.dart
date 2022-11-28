import 'dart:io';

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sign_in/src/domain/entities/token_entity.dart';
import 'package:sign_in/src/presentation/widgets/password_recover_link.dart';
import 'package:sign_in/src/presentation/widgets/register_link.dart';
import 'package:sign_in/src/presentation/widgets/sign_in_button.dart';
import 'package:sign_in/src/presentation/widgets/sign_in_logo.dart';
import 'package:sign_in/src/presentation/widgets/sign_in_text_form_field.dart';

class SingInBuildInitial extends StatefulWidget {
  final String _userText;
  final String _passwordText;
  final String _buttonText;
  final String _descriptionText;
  final ThemeData _theme;
  final String _emailEmptyText;
  final String _passwordEmptyText;
  final String _passwordFormatInvalid;
  final UrlLauncherManager _urlLauncherManager;
  final String _areYouNew;
  final String _forgotPassword;
  final String _impossibleToConnect;
  final String _areYouSureClosing;
  final String _cancelText;
  const SingInBuildInitial({
    Key? key,
    required String userText,
    required String passwordText,
    required String buttonText,
    required String descriptionText,
    required ThemeData theme,
    required String emailEmptyText,
    required String passwordEmptyText,
    required String passwordFormatInvalid,
    required UrlLauncherManager urlLauncherManager,
    required String areYouNew,
    required String forgotPassword,
    required String impossibleToConnect,
    required String areYouSureClosing,
    required String cancelText,
  })  : _userText = userText,
        _passwordText = passwordText,
        _buttonText = buttonText,
        _theme = theme,
        _descriptionText = descriptionText,
        _emailEmptyText = emailEmptyText,
        _passwordEmptyText = passwordEmptyText,
        _passwordFormatInvalid = passwordFormatInvalid,
        _urlLauncherManager = urlLauncherManager,
        _areYouNew = areYouNew,
        _impossibleToConnect = impossibleToConnect,
        _forgotPassword = forgotPassword,
        _areYouSureClosing = areYouSureClosing,
        _cancelText = cancelText,
        super(key: key);

  @override
  State<SingInBuildInitial> createState() => _SignInInitialState();
}

class _SignInInitialState extends State<SingInBuildInitial> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _userNameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final _passwordValidator = PasswordValidator();

  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _buildFotSmartPhone(),
      tablet: (context) => _buildFotTablet(),
    );
  }

  Widget _buildFotTablet() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/movie-background.jpg',
            package: 'core',
          ),
          fit: BoxFit.none,
          opacity: 1.1,
          colorFilter: ColorFilter.linearToSrgbGamma(),
        ),
      ),
      child: WillPopScope(
        onWillPop: () async {
          _areYouSure(
            context,
            () {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              } else if (Platform.isIOS) {
                exit(0);
              }
            },
          );
          return false;
        },
        child: _buildSignInForm(true),
      ),
    );
  }

  Widget _buildFotSmartPhone() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/movie-background.jpg',
            package: 'core',
          ),
          fit: BoxFit.none,
          opacity: 1.1,
          colorFilter: ColorFilter.linearToSrgbGamma(),
        ),
      ),
      child: WillPopScope(
        onWillPop: () async {
          _areYouSure(
            context,
            () {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              } else if (Platform.isIOS) {
                exit(0);
              }
            },
          );
          return false;
        },
        child: _buildSignInForm(false),
      ),
    );
  }

  Form _buildSignInForm(bool isTablet) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 5,
          ),
          _buildLogo(
            isTablet ? 380 : 120,
            isTablet ? 350 : 100,
          ),
          const SizedBox(
            height: 45,
          ),
          _buildTitleText(
            isTablet ? 38 : 22,
          ),
          const SizedBox(
            height: 10,
          ),
          _buildUserTextField(
            context,
            isTablet ? 680 : double.infinity,
            isTablet ? 80 : 50,
          ),
          const SizedBox(
            height: 10,
          ),
          _buildPasswordTextField(
            context,
            isTablet ? 680 : double.infinity,
            isTablet ? 80 : 50,
          ),
          _buildSubmitButton(
            isTablet ? 680 : double.infinity,
            isTablet ? 80 : 50,
            isTablet ? 38 : 22,
          ),
          const SizedBox(
            height: 20,
          ),
          _buildRegisterLink(
            isTablet ? 36 : 14,
          ),
          _buildPasswordRecoveryLink(
            isTablet ? 36 : 14,
          ),
        ],
      ),
    );
  }

  PasswordRecoverLink _buildPasswordRecoveryLink(
    double fontSize,
  ) {
    return PasswordRecoverLink(
      urlLauncherManager: widget._urlLauncherManager,
      forgotPasswordText: widget._forgotPassword,
      impossibleToConnect: widget._impossibleToConnect,
      fontSize: fontSize,
    );
  }

  RegisterLink _buildRegisterLink(
    double fontSize,
  ) {
    return RegisterLink(
      urlLauncherManager: widget._urlLauncherManager,
      areYouNew: widget._areYouNew,
      impossibleToConnect: widget._impossibleToConnect,
      fontSize: fontSize,
    );
  }

  Container _buildSubmitButton(
    double width,
    double height,
    double fontSize,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: SignInElevatedButton(
        width: width,
        heigth: height,
        buttonText: widget._buttonText,
        theme: widget._theme,
        userNameController: _userNameController,
        passwordController: _passwordController,
        formKey: _formKey,
        fontSize: fontSize,
      ),
    );
  }

  Widget _buildPasswordTextField(
    BuildContext context,
    double width,
    double height,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SignInTextFormField(
        userNameController: _passwordController,
        userNameFocusNode: _passwordFocusNode,
        obscureText: !_showPassword,
        onSubmitted: (value) => _passwordFocusNode.unfocus(),
        suffixAction: IconButton(
          onPressed: () => setState(
            () => _showPassword = !_showPassword,
          ),
          icon: _showPassword
              ? const Icon(
                  Icons.visibility_outlined,
                  color: Colors.blueAccent,
                )
              : const Icon(
                  Icons.visibility_off_outlined,
                  color: Colors.redAccent,
                ),
        ),
        text: widget._passwordText.trim(),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return widget._passwordEmptyText;
          }
          if (_passwordValidator.passwordValidator(value)) {
            return widget._passwordFormatInvalid;
          }
          return null;
        },
        width: width,
        heigth: height,
        fillColor: Colors.white,
      ),
    );
  }

  Widget _buildUserTextField(
    BuildContext context,
    double width,
    double height,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SignInTextFormField(
        userNameController: _userNameController,
        userNameFocusNode: _userNameFocusNode,
        textInputAction: TextInputAction.next,
        textInputType: TextInputType.emailAddress,
        text: widget._userText.trim(),
        onSubmitted: (value) {
          _userNameFocusNode.unfocus();
          FocusScope.of(context).requestFocus(_passwordFocusNode);
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return widget._emailEmptyText;
          }

          return null;
        },
        width: width,
        heigth: height,
        fillColor: Colors.white,
      ),
    );
  }

  Widget _buildTitleText(double fontSize) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Text(
        widget._descriptionText,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }

  Widget _buildLogo(
    double width,
    double height,
  ) {
    return SizedBox(
      height: width,
      width: height,
      child: SignInLogo(
        imageHeigth: height,
        imageWidth: width,
      ),
    );
  }

  void _areYouSure(
    BuildContext context,
    VoidCallback okAction,
  ) {
    AlertDialogUtils.showAlertWithTwoActions(
      context: context,
      image: Image.asset(
        'assets/images/movie-icon-logo.jpg',
        package: 'core',
        height: 80,
        width: 80,
      ),
      title: widget._areYouSureClosing,
      subtitle: '',
      okAction: okAction,
      titleOkButton: 'OK',
      cancelAction: () {
        Navigator.pop(context);
      },
      titleCancelButton: widget._cancelText,
      theme: widget._theme,
    );
  }
}
