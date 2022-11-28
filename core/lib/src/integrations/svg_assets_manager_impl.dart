import 'package:core/src/abstractions/sgv_assets_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SgvAssetsManagerImpl implements SvgAssetsManager {
  @override
  dynamic svgPicture(
    asset,
    color,
    height,
    width,
  ) {
    return SvgPicture.asset(
      asset,
      color: color,
      height: height,
      width: width,
      package: 'core',
    );
  }
}
