import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomLoadingIndicator extends StatefulWidget {
  final Image _customIndicatorImage;

  const CustomLoadingIndicator({
    Key? key,
    required Image customIndicatorImage,
  })  : _customIndicatorImage = customIndicatorImage,
        super(key: key);

  @override
  State<CustomLoadingIndicator> createState() => _CustomLoadingIndicatorState();
}

class _CustomLoadingIndicatorState extends State<CustomLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: false);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) {
        return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(_animation.value * math.pi),
            alignment: Alignment.center,
            child: widget._customIndicatorImage);
      },
    );
  }
}
