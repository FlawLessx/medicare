import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'shimmer_widget.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    Key? key,
    required this.height,
    required this.width,
    this.radius,
    required this.url,
    this.fit,
    this.errorWidget,
  }) : super(key: key);
  final double height;
  final double width;
  final double? radius;
  final String url;
  final BoxFit? fit;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 15.w),
      child: CachedNetworkImage(
        memCacheHeight: 400,
        imageUrl: url,
        placeholder: (context, url) => ShimmerWidget(
          height: height,
          width: width,
          radius: radius ?? 5.w,
        ),
        errorWidget: (context, url, dynamic error) =>
            errorWidget ??
            ShimmerWidget(
              height: height,
              width: width,
              radius: radius ?? 5.w,
            ),
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
      ),
    );
  }
}
