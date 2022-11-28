import 'package:core/src/abstractions/sgv_assets_manager.dart';
import 'package:flutter/material.dart';

class CustomFloatingSnackBar extends StatelessWidget {
  final String _titleMessage;
  final String _message;
  final Color _color;
  final Color _sgvColor;
  final SvgAssetsManager _svgAssetsManager;
  const CustomFloatingSnackBar({
    Key? key,
    required SvgAssetsManager svgAssetsManager,
    required String titleMessage,
    required String message,
    required Color color,
    required Color sgvColor,
  })  : _svgAssetsManager = svgAssetsManager,
        _titleMessage = titleMessage,
        _message = message,
        _color = color,
        _sgvColor = sgvColor,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: 90,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                20,
              ),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 48,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _titleMessage,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      _message,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(
                20,
              ),
            ),
            child: _svgAssetsManager.svgPicture(
              'assets/images/bubbles.svg',
              _sgvColor,
              48,
              40,
            ),
          ),
        ),
        Positioned(
          top: -20,
          left: 0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              _svgAssetsManager.svgPicture(
                'assets/images/fail.svg',
                _sgvColor,
                40,
                null,
              ),
              Positioned(
                top: 10,
                child: _svgAssetsManager.svgPicture(
                  'assets/images/close.svg',
                  Colors.white,
                  16,
                  null,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
