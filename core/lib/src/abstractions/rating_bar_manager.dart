import 'package:flutter/material.dart';

abstract class RatingBarManager {
  Widget ratingBar(
    double initialRating,
    Axis direction,
    bool allowHalfRating,
    int itemCount,
    dynamic ratingWidget,
    EdgeInsetsGeometry itemPadding,
    void Function(double) onRatingUpdate,
    double itemSize,
  );

  Widget ratingBarBuilder(
    double initialRating,
    double minRating,
    Axis direction,
    bool allowHalfRating,
    int itemCount,
    EdgeInsetsGeometry itemPadding,
    Widget Function(BuildContext, int) itemBuilder,
    void Function(double) onRatingUpdate,
    double itemSize,
  );

  Widget ratingBarIndicator(
    double rating,
    Widget Function(BuildContext, int) itemBuilder,
    int itemCount,
    double itemSize,
    Axis direction,
    ScrollPhysics physics,
    Color? unratedColor,
  );
}
