import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sign_in/src/presentation/cubit/sign_in_cubit.dart';
import 'package:sign_in/src/presentation/widgets/sign_in_initial.dart';

class SignInComponent extends StatefulWidget {
  final SignInCubit _cubit;
  final String _userText;
  final String _passwordText;
  final String _buttonText;
  final String _descriptionText;
  final String _signInErrorLabel;
  final ThemeData _theme;
  final Function(BuildContext, String) _onSignInSuccessful;
  final String _emailEmptyText;
  final String _passwordEmptyText;
  final String _passwordFormatInvalid;
  final String _labelVerifyIntertnetConnection;
  final UrlLauncherManager _urlLauncherManager;
  final String _areYouNew;
  final String _forgotPassword;
  final String _impossibleToConnect;
  final CustomTopSnackBarManager _customTopSnackBarManager;
  final String _areYouSureClosing;
  final String _cancelText;
  final String _retryText;

  const SignInComponent({
    Key? key,
    required SignInCubit cubit,
    required String userText,
    required String passwordText,
    required String buttonText,
    required String descriptionText,
    required String signInErrorLabel,
    required ThemeData theme,
    required Function(BuildContext, String) onSignInSuccessful,
    required String emailEmptyText,
    required String passwordEmptyText,
    required String passwordFormatInvalid,
    required String labelVerifyIntertnetConnection,
    required UrlLauncherManager urlLauncherManager,
    required CustomTopSnackBarManager customTopSnackBarManager,
    required String areYouNew,
    required String forgotPassword,
    required String impossibleToConnect,
    required String areYouSureClosing,
    required String cancelText,
    required String retryText,
  })  : _cubit = cubit,
        _userText = userText,
        _passwordText = passwordText,
        _buttonText = buttonText,
        _signInErrorLabel = signInErrorLabel,
        _theme = theme,
        _descriptionText = descriptionText,
        _onSignInSuccessful = onSignInSuccessful,
        _emailEmptyText = emailEmptyText,
        _passwordEmptyText = passwordEmptyText,
        _passwordFormatInvalid = passwordFormatInvalid,
        _labelVerifyIntertnetConnection = labelVerifyIntertnetConnection,
        _urlLauncherManager = urlLauncherManager,
        _customTopSnackBarManager = customTopSnackBarManager,
        _areYouNew = areYouNew,
        _impossibleToConnect = impossibleToConnect,
        _forgotPassword = forgotPassword,
        _areYouSureClosing = areYouSureClosing,
        _cancelText = cancelText,
        _retryText = retryText,
        super(key: key);

  @override
  State<SignInComponent> createState() => _SignInComponentState();
}

class _SignInComponentState extends State<SignInComponent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BlocProvider.value(
        value: widget._cubit..initState(),
        child: Form(
          key: _formKey,
          child: BlocConsumer<SignInCubit, SignInState>(
            listener: (context, state) async {
              if (state is SignInError) {
                widget._customTopSnackBarManager.showErrorTopSnackbar(
                  context,
                  widget._signInErrorLabel,
                );

                await widget._cubit.initState();
              }
              if (state is SignInConnectionError) {
                if (!mounted) return;
                widget._customTopSnackBarManager.showErrorTopSnackbar(
                  context,
                  widget._labelVerifyIntertnetConnection,
                );
                await widget._cubit.initState();
              }

              if (state is SignInSuccsessful) {
                if (!mounted) return;
                widget._onSignInSuccessful(
                  context,
                  state.tokenEntity.token,
                );
                widget._customTopSnackBarManager.showSuccessTopSnackbar(
                  context: context,
                  message: widget._descriptionText,
                );
              }
            },
            builder: _buildByState,
          ),
        ),
      ),
    );
  }

  Widget _buildByState(
    BuildContext context,
    SignInState state,
  ) {
    if (state is SignInInitial) {
      return SingInBuildInitial(
        buttonText: widget._buttonText,
        descriptionText: widget._descriptionText,
        emailEmptyText: widget._emailEmptyText,
        passwordEmptyText: widget._passwordEmptyText,
        passwordFormatInvalid: widget._passwordFormatInvalid,
        passwordText: widget._passwordText,
        theme: widget._theme,
        userText: widget._userText,
        urlLauncherManager: widget._urlLauncherManager,
        areYouNew: widget._areYouNew,
        impossibleToConnect: widget._impossibleToConnect,
        forgotPassword: widget._forgotPassword,
        areYouSureClosing: widget._areYouSureClosing,
        cancelText: widget._cancelText,
      );
    } else if (state is SignInLoading) {
      var size = MediaQuery.of(context).size;
      return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/movie-background.jpg',
              package: 'core',
            ),
            fit: BoxFit.none,
            opacity: 1.2,
          ),
        ),
        height: size.height * 0.99,
        width: size.width * 0.99,
        child: CustomLoadingIndicator(
          customIndicatorImage: Image.asset(
            'assets/images/movie-icon-logo.jpg',
            package: 'core',
          ),
        ),
      );
    } else if (state is SignInConnectionError) {
      return GestureDetector(
        onTap: () => widget._cubit.initState(),
        child: Center(
          child: Column(
            children: [
              const Icon(
                Icons.refresh_rounded,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(widget._retryText),
            ],
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
