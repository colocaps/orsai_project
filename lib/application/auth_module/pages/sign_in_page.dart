import 'package:core/core.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var homeSearchCubit = InjectorContainer.instance.resolve<HomeSearchCubit>();
    var customSnackBar =
        InjectorContainer.instance.resolve<CustomTopSnackBarManager>();

    final GlobalKey<FormState> formKey = GlobalKey();
    //  final token = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: WillPopScope(
        onWillPop: () async {
          _areYouSure(context, () {
            //  SignInModule.navigateToSignIn(context);
            _showCloseSessionSnackbar(customSnackBar, context);
          });
          return false;
        },
        child: Form(
          key: formKey,
          child: PageContainerWithIcon(
              bgColor: Theme.of(context).backgroundColor,
              appBarColor: Colors.grey[900],
              withoutContentPadding: true,
              showIconContainer: false,
              centerTitle: true,
              showBoxContainer: false,
              appBarHeight: 80,
              body: Container(),
              iconSrc: '',
              landingLeft: const Icon(Icons.search),
              titleWidget: const SizedBox.shrink()),
        ),
      ),
    );
  }

  void _showCloseSessionSnackbar(
      CustomTopSnackBarManager customSnackBar, BuildContext context) {
    customSnackBar.showSuccessTopSnackbar(
      context: context,
      message: 'Gracias',
    );
  }

  void _areYouSure(
    BuildContext context,
    VoidCallback okAction,
  ) {
    AlertDialogUtils.showAlertWithTwoActions(
      context: context,
      image: Image.asset(
        'assets/images/loading.gif',
        package: 'core',
        height: 80,
        width: 80,
      ),
      title: 'Esta seguro',
      subtitle: '',
      okAction: okAction,
      titleOkButton: 'OK',
      cancelAction: () {
        Navigator.pop(context);
      },
      titleCancelButton: 'Cancelar',
      theme: Theme.of(context),
    );
  }
}
