import 'package:core/src/abstractions/rive_animations_manager.dart';

class RiveAnimationsManagerImpl implements RiveAnimationsManager {
  @override
  String buildAnimationFromNetwork(
    String url,
  ) {
    return url;
  }

  @override
  String buildAnimationFromAsset(String url) {
    return url;
  }

  @override
  String buildAnimationFromFile(String url) {
    return url;
  }
}
