import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../configs/app_colors.dart';

class ShimmerImage extends StatelessWidget {
  final String imageUrl;
  final Widget errorWidget;

  const ShimmerImage({
    Key? key,
    required this.imageUrl,
    required this.errorWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      imageUrl,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,
      cache: true,
      loadStateChanged: _loadStateChanged,
    );
  }

  Widget _loadStateChanged(ExtendedImageState state) {
    switch (state.extendedImageLoadState) {
      case LoadState.loading:
        return Shimmer.fromColors(
          baseColor: AppColors.shimmerBaseColor!,
          highlightColor: AppColors.shimmerHighlightColor!,
          child: Center(child: Container()),
        );
      case LoadState.completed:
        return ExtendedRawImage(
          image: state.extendedImageInfo?.image,
          fit: BoxFit.cover,
        );
      case LoadState.failed:
        return errorWidget;
    }
  }
}
