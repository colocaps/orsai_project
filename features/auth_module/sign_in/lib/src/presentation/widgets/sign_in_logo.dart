import 'package:core/core.dart';
import 'package:flutter/material.dart';

class SignInLogo extends StatelessWidget {
  final double _imageWidth;
  final double _imageHeigth;
  const SignInLogo({
    Key? key,
    required double imageWidth,
    required double imageHeigth,
  })  : _imageHeigth = imageHeigth,
        _imageWidth = imageWidth,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomImageContainer(
      imageHeigth: _imageHeigth,
      imageWith: _imageWidth,
      edgeInsetsMargin: const EdgeInsets.only(top: 25),
      edgeInsetsPadding: const EdgeInsets.symmetric(horizontal: 10),
      child: Image.asset(
        'assets/images/movie-icon-logo.jpg',
        package: 'core',
        fit: BoxFit.cover,
      ),
    );
  }
}
