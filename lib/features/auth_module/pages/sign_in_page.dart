import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:orsai_project/features/auth_module/auth_module.dart';
import 'package:sign_in/sign_in.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: SafeArea(
          child: Center(
            child: SignInComponent(
              cubit: InjectorContainer.instance.resolve<SignInCubit>(),
              userText: AppLocalizations.of(context)!.user_label,
              passwordText: AppLocalizations.of(context)!.password_label,
              buttonText: AppLocalizations.of(context)!.sign_in_label,
              signInErrorLabel: AppLocalizations.of(context)!.sign_in_error,
              descriptionText: AppLocalizations.of(context)!.description_label,
              theme: ApplicationTheme.light,
              onSignInSuccessful: AuthModule.navigateToHome,
              emailEmptyText: AppLocalizations.of(context)!.empty_text_email,
              passwordEmptyText:
                  AppLocalizations.of(context)!.empty_text_password,
              passwordFormatInvalid:
                  AppLocalizations.of(context)!.invalid_format_password,
              labelVerifyIntertnetConnection: AppLocalizations.of(context)!
                  .label_verify_internet_connection,
              urlLauncherManager:
                  InjectorContainer.instance.resolve<UrlLauncherManager>(),
              customTopSnackBarManager: InjectorContainer.instance
                  .resolve<CustomTopSnackBarManager>(),
              areYouNew: AppLocalizations.of(context)!.are_you_new,
              impossibleToConnect:
                  AppLocalizations.of(context)!.impossible_to_connect,
              forgotPassword: AppLocalizations.of(context)!.forgot_password,
              areYouSureClosing:
                  AppLocalizations.of(context)!.are_your_sure_of_close,
              cancelText:
                  AppLocalizations.of(context)!.label_cancel.toUpperCase(),
              retryText: '',
            ),
          ),
        ),
      ),
    );
  }
}
