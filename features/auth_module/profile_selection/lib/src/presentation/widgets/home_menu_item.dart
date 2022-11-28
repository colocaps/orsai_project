import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeMenuItem extends StatelessWidget {
  final String _imageRoute;
  final String _itemName;
  final Color _backgroundColor;
  final double _height;
  final double _width;
  const HomeMenuItem({
    Key? key,
    required String imageRoute,
    required String itemName,
    required Color backgroundColor,
    required double height,
    required double width,
  })  : _imageRoute = imageRoute,
        _itemName = itemName,
        _backgroundColor = backgroundColor,
        _width = width,
        _height = height,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: _height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(
            16,
          ),
        ),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color.alphaBlend(
              Colors.black26,
              _backgroundColor,
            ),
            _backgroundColor,
          ],
          tileMode: TileMode.clamp,
        ),
        color: _backgroundColor,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 42 * 0.8,
          ),
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  spreadRadius: 0.5,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Hero(
              tag: _imageRoute,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: Device.screenType == ScreenType.mobile
                    ? 58 * 0.8
                    : 78 * 0.8,
                child: Image.asset(
                  _imageRoute,
                  package: 'core',
                  height: Device.screenType == ScreenType.mobile
                      ? 80 * 0.8
                      : 100 * 0.8,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12 * 0.8,
          ),
          Text(
            _itemName,
            style: TextStyle(
              color: Colors.white,
              fontSize: Device.screenType == ScreenType.mobile ? 17 : 29,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
