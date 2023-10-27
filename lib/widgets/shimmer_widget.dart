import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:medicare/app/app.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.radius,
  }) : super(key: key);
  final double height;
  final double width;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return FadeShimmer(
      height: height,
      width: width,
      radius: radius,
      millisecondsDelay: 500,
      highlightColor: AppTheme.shimmerHighlightColor,
      baseColor: AppTheme.shimmerBaseColor,
    );
  }
}
