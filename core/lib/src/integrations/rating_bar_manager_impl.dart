import 'package:core/src/abstractions/rating_bar_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarManagerImpl implements RatingBarManager {
  @override
  Widget ratingBar(
    double initialRating,
    Axis direction,
    bool allowHalfRating,
    int itemCount,
    dynamic ratingWidget,
    EdgeInsetsGeometry itemPadding,
    void Function(double) onRatingUpdate,
    double itemSize,
  ) {
    return RatingBar(
      initialRating: initialRating,
      direction: direction,
      allowHalfRating: allowHalfRating,
      itemCount: itemCount,
      ratingWidget: ratingWidget,
      itemPadding: itemPadding,
      onRatingUpdate: onRatingUpdate,
      itemSize: itemSize,
    );
  }

  @override
  Widget ratingBarBuilder(
      double initialRating,
      double minRating,
      Axis direction,
      bool allowHalfRating,
      int itemCount,
      EdgeInsetsGeometry itemPadding,
      Widget Function(BuildContext, int) itemBuilder,
      void Function(double) onRatingUpdate,
      double itemSize) {
    return RatingBar.builder(
      initialRating: initialRating,
      minRating: minRating,
      direction: direction,
      allowHalfRating: allowHalfRating,
      itemCount: itemCount,
      itemPadding: itemPadding,
      itemBuilder: itemBuilder,
      onRatingUpdate: onRatingUpdate,
      itemSize: itemSize,
      unratedColor: Colors.black12,
    );
  }

  @override
  Widget ratingBarIndicator(
    double rating,
    Widget Function(BuildContext, int) itemBuilder,
    int itemCount,
    double itemSize,
    Axis direction,
    ScrollPhysics physics,
    Color? unratedColor,
  ) {
    return RatingBarIndicator(
        rating: rating,
        itemBuilder: itemBuilder,
        itemCount: itemCount,
        itemSize: itemSize,
        direction: direction,
        physics: physics,
        unratedColor: unratedColor);
  }
}
