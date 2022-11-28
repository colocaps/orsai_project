import 'package:core/src/abstractions/rating_bar_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarBuilder extends StatelessWidget {
  final RatingBarManager _ratingBarManager;
  final double _initialRating;
  final double _minRating;
  final Axis _direction;
  final bool _allowHalfRating;
  final int _itemCount;
  final EdgeInsetsGeometry _itemPadding;
  final Widget Function(BuildContext, int) _itemBuilder;
  final void Function(double) _onRatingUpdate;
  final double _itemSize;
  final RatingBarType _ratingBarType;
  final RatingWidget _ratingWidget;
  final ScrollPhysics _physics;
  final Color? _unratedColor;
  const RatingBarBuilder({
    Key? key,
    required RatingBarManager ratingBarManager,
    required double initialRating,
    required double minRating,
    required Axis direction,
    required bool allowHalfRating,
    required int itemCount,
    required EdgeInsetsGeometry itemPadding,
    required Widget Function(BuildContext, int) itemBuilder,
    required void Function(double) onRatingUpdate,
    required double itemSize,
    required RatingBarType ratingBarType,
    required RatingWidget ratingWidget,
    required ScrollPhysics physics,
    Color? unratedColor,
  })  : _ratingBarManager = ratingBarManager,
        _initialRating = initialRating,
        _minRating = minRating,
        _direction = direction,
        _allowHalfRating = allowHalfRating,
        _itemCount = itemCount,
        _itemPadding = itemPadding,
        _itemBuilder = itemBuilder,
        _onRatingUpdate = onRatingUpdate,
        _itemSize = itemSize,
        _ratingBarType = ratingBarType,
        _ratingWidget = ratingWidget,
        _physics = physics,
        _unratedColor = unratedColor,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (_ratingBarType) {
      case RatingBarType.ratingBar:
        return Container(
          child: _ratingBarManager.ratingBar(
            _initialRating,
            _direction,
            _allowHalfRating,
            _itemCount,
            _ratingWidget,
            _itemPadding,
            _onRatingUpdate,
            _itemSize,
          ),
        );

      case RatingBarType.ratingBarBuilder:
        return Container(
          child: _ratingBarManager.ratingBarBuilder(
            _initialRating,
            _minRating,
            _direction,
            _allowHalfRating,
            _itemCount,
            _itemPadding,
            _itemBuilder,
            _onRatingUpdate,
            _itemSize,
          ),
        );

      case RatingBarType.ratingbarIndicator:
        return Container(
          child: _ratingBarManager.ratingBarIndicator(
            _initialRating,
            _itemBuilder,
            _itemCount,
            _itemSize,
            _direction,
            _physics,
            _unratedColor,
          ),
        );
      default:
        const SizedBox.shrink();
    }
    return const SizedBox.shrink();
  }
}

enum RatingBarType {
  ratingBar,
  ratingBarBuilder,
  ratingbarIndicator,
}
