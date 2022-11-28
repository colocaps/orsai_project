import 'package:auto_size_text/auto_size_text.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class RegisterLink extends StatelessWidget {
  final UrlLauncherManager _urlLauncherManager;
  final String _areYouNew;
  final String _impossibleToConnect;
  final double _fontSize;
  const RegisterLink({
    Key? key,
    required UrlLauncherManager urlLauncherManager,
    required String areYouNew,
    required String impossibleToConnect,
    required double fontSize,
  })  : _urlLauncherManager = urlLauncherManager,
        _areYouNew = areYouNew,
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
            _areYouNew,
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
        final Uri url = Uri.parse('https://www.themoviedb.org/signup');
        await _urlLauncherManager.launchUrlInBrowser(url, _impossibleToConnect);
      },
    );
  }
}
