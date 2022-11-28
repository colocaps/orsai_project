import 'package:auto_size_text/auto_size_text.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class PasswordRecoverLink extends StatelessWidget {
  final UrlLauncherManager _urlLauncherManager;
  final String _forgotPasswordText;
  final String _impossibleToConnect;
  final double _fontSize;
  const PasswordRecoverLink({
    Key? key,
    required UrlLauncherManager urlLauncherManager,
    required String forgotPasswordText,
    required String impossibleToConnect,
    required double fontSize,
  })  : _urlLauncherManager = urlLauncherManager,
        _forgotPasswordText = forgotPasswordText,
        _impossibleToConnect = impossibleToConnect,
        _fontSize = fontSize,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Center(
          child: AutoSizeText(
            _forgotPasswordText,
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.blue,
              fontSize: _fontSize,
            ),
            maxLines: 2,
          ),
        ),
      ),
      onTap: () async {
        final Uri url = Uri.parse('https://www.themoviedb.org/reset-password');
        await _urlLauncherManager.launchUrlInBrowser(url, _impossibleToConnect);
      },
    );
  }
}
