import 'package:flutter/material.dart';

class CustomImageContainer extends StatelessWidget {
  final EdgeInsets _edgeInsetsMargin;
  final EdgeInsets _edgeInsetsPadding;
  final BoxDecoration? _boxDecoration;
  final Widget _child;
  final double _imageWith;
  final double _imageHeigth;
  final Color? _backColor;

  const CustomImageContainer({
    Key? key,
    required EdgeInsets edgeInsetsMargin,
    required EdgeInsets edgeInsetsPadding,
    required Widget child,
    required double imageWith,
    required double imageHeigth,
    Color? backColor,
    BoxDecoration? boxDecoration,
  })  : _edgeInsetsMargin = edgeInsetsMargin,
        _edgeInsetsPadding = edgeInsetsPadding,
        _boxDecoration = boxDecoration,
        _child = child,
        _imageWith = imageWith,
        _imageHeigth = imageHeigth,
        _backColor = backColor,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _edgeInsetsMargin,
      padding: _edgeInsetsPadding,
      decoration: _boxDecoration,
      width: _imageWith,
      height: _imageHeigth,
      color: _backColor,
      child: _child,
    );
  }
}
