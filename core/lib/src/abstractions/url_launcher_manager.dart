abstract class UrlLauncherManager {
  Future<void> launchUrlInBrowser(
    Uri url,
    String message,
  );

  Future<void> launchInWebViewOrVC(
    Uri url,
    String message,
    String headerKey,
  );
  Future<void> launchInWebViewWithoutJavaScript(
    Uri url,
    String message,
  );
  Future<void> launchInWebViewWithoutDomStorage(
    Uri url,
    String message,
  );
  Future<void> launchUniversalLinkIos(Uri url);
  dynamic launchStatus(
    dynamic context,
    dynamic snapshot,
    dynamic text,
  );
  Future<void> makePhoneCall(String phoneNumber);
}
