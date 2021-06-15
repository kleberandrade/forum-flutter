import 'package:flutter/material.dart';

import '../../../core/configs/app_colors.dart';
import '../../../core/configs/app_text_styles.dart';
import '../../../core/helpers/string_helper.dart';
import '../../../core/widgets/images/circle_avatar_network.dart';

class ProfileHeaderTile extends StatelessWidget {
  final String name;
  final String email;
  final String pictureUrl;
  final EdgeInsets padding;
  final Decoration? decoration;

  const ProfileHeaderTile({
    required this.name,
    required this.email,
    required this.pictureUrl,
    this.padding = const EdgeInsets.fromLTRB(20, 70, 20, 30),
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatarNetwork(
            imageUrl: pictureUrl,
            initials: StringHelper.getInitials(name),
            radius: 40,
            color: AppColors.white,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  StringHelper.getFirstAndLastWord(name),
                  textAlign: TextAlign.start,
                  style: AppTextStyles.headingWhite,
                ),
                const SizedBox(height: 8),
                Text(
                  email,
                  textAlign: TextAlign.start,
                  style: AppTextStyles.headingWhite15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
