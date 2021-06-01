import 'package:flutter/material.dart';
import 'package:forum_manha/core/configs/app_colors.dart';

import 'shimmer_image.dart';

class CircleAvatarNetwork extends StatelessWidget {
  final String initials;
  final String imageUrl;
  final String ignore;
  final double radius;
  final Color color;

  const CircleAvatarNetwork({
    Key? key,
    required this.initials,
    required this.imageUrl,
    this.ignore = 'noimage',
    this.radius = 20.0,
    this.color = AppColors.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final url = imageUrl.contains(ignore) ? null : imageUrl;

    return ClipOval(
      child: Container(
        width: radius * 2,
        height: radius * 2,
        color: color.withOpacity(0.2),
        child: url == null || url.isEmpty
            ? _buildInitials()
            : ShimmerImage(
                imageUrl: url,
                errorWidget: _buildInitials(),
              ),
      ),
    );
  }

  Widget _buildInitials() {
    return Center(
      child: Text(
        initials,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: radius * 0.7,
          color: color.withOpacity(0.8),
        ),
      ),
    );
  }
}
