import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CustomSwiper extends StatelessWidget {
  final Widget Function(BuildContext, int)? _itemBuilder;
  final int _itemCount;
  final void Function(int)? _onIndexChanged;
  final int? _index;
  final SwiperLayout _layout;
  final void Function(int)? _onTap;
  final SwiperPlugin? _control;
  final SwiperPlugin? _pagination;
  final List<SwiperPlugin>? _plugins;
  final ScrollPhysics? _physics;
  final SwiperController? _controller;
  final CustomLayoutOption? _customLayoutOption;
  final double? _containerHeight;
  final double? _containerWidth;
  final double? _itemHeight;
  final double? _itemWidth;
  final double? _scale;
  final double? _fade;

  const CustomSwiper({
    Key? key,
    Widget Function(BuildContext, int)? itemBuilder,
    required int itemCount,
    void Function(int)? onIndexChanged,
    int? index,
    SwiperLayout? layout,
    void Function(int)? onTap,
    SwiperPlugin? control,
    SwiperPlugin? pagination,
    List<SwiperPlugin>? plugins,
    ScrollPhysics? physics,
    SwiperController? controller,
    CustomLayoutOption? customLayoutOption,
    double? containerHeight,
    double? containerWidth,
    double? itemHeight,
    double? itemWidth,
    double? scale,
    double? fade,
  })  : _itemBuilder = itemBuilder,
        _itemCount = itemCount,
        _onIndexChanged = onIndexChanged,
        _index = index,
        _layout = SwiperLayout.STACK,
        _onTap = onTap,
        _control = control,
        _pagination = pagination,
        _plugins = plugins,
        _physics = physics,
        _controller = controller,
        _customLayoutOption = customLayoutOption,
        _containerHeight = containerHeight,
        _containerWidth = containerWidth,
        _itemHeight = itemHeight,
        _itemWidth = itemWidth,
        _scale = scale,
        _fade = fade,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: _itemBuilder,
      itemCount: _itemCount,
      onIndexChanged: _onIndexChanged,
      index: _index,
      layout: _layout,
      onTap: _onTap,
      control: _control,
      pagination: _pagination,
      plugins: _plugins,
      physics: _physics,
      controller: _controller,
      customLayoutOption: _customLayoutOption,
      containerHeight: _containerHeight,
      containerWidth: _containerWidth,
      itemHeight: _itemHeight,
      itemWidth: _itemWidth,
      scale: _scale,
      fade: _fade,
    );
  }
}
