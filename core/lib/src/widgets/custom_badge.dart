import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class CustomBadgeIcon extends StatelessWidget {
  final Widget _badgeContent;
  final Widget _child;
  final Color _badgeColor;

  final BadgePosition? _position;

  final Gradient? _gradient;

  const CustomBadgeIcon({
    Key? key,
    required Widget badgeContent,
    required Widget child,
    required Color badgeColor,
    BadgePosition? position,
    Gradient? gradient,
  })  : _badgeColor = badgeColor,
        _child = child,
        _badgeContent = badgeContent,
        _position = position,
        _gradient = gradient,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Badge(
      badgeContent: _badgeContent,
      badgeColor: _badgeColor,
      position: _position,
      gradient: _gradient,
      child: _child,
    );
  }
}
