import 'package:core/src/abstractions/url_launcher_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherManagerImpl implements UrlLauncherManager {
  @override
  Future<void> launchUrlInBrowser(
    Uri url,
    String message,
  ) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) throw '$message $url';
  }

  @override
  Future<void> launchInWebViewOrVC(
    Uri url,
    String message,
    String headerKey,
  ) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'headerKey': 'headerKey'}),
    )) {
      throw '$message $url';
    }
  }

  @override
  Future<void> launchInWebViewWithoutDomStorage(
    Uri url,
    String message,
  ) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
        enableDomStorage: false,
      ),
    )) {
      throw '$message $url';
    }
  }

  @override
  Future<void> launchInWebViewWithoutJavaScript(
    Uri url,
    String message,
  ) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
        enableJavaScript: false,
      ),
    )) {
      throw '$message $url';
    }
  }

  @override
  launchStatus(
    context,
    snapshot,
    text,
  ) {
    if (snapshot.hasError) {
      return text + '${snapshot.error}';
    } else {
      return text + '';
    }
  }

  @override
  Future<void> launchUniversalLinkIos(Uri url) async {
    final bool nativeAppLaunchSucceeded = await launchUrl(
      url,
      mode: LaunchMode.externalNonBrowserApplication,
    );
    if (!nativeAppLaunchSucceeded) {
      await launchUrl(
        url,
        mode: LaunchMode.inAppWebView,
      );
    }
  }

  @override
  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
