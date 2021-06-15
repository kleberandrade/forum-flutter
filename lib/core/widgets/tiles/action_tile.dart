import 'package:flutter/material.dart';

import '../../configs/app_colors.dart';
import '../../configs/app_text_styles.dart';

enum ActionTileBrightness { light, dart }

class ActionTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Color iconColor;
  final Color backgroundColor;
  final EdgeInsets padding;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function()? onTap;
  final ActionTileBrightness? brightness;

  const ActionTile({
    Key? key,
    required this.title,
    required this.onTap,
    this.iconColor = AppColors.black,
    this.backgroundColor = AppColors.white,
    this.subtitle,
    this.prefixIcon,
    this.suffixIcon,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
    this.brightness = ActionTileBrightness.light,
  }) : super(key: key);

  const ActionTile.next({
    Key? key,
    required this.title,
    required this.onTap,
    this.iconColor = AppColors.black,
    this.backgroundColor = AppColors.white,
    this.subtitle,
    this.prefixIcon,
    this.suffixIcon = Icons.navigate_next,
    this.brightness = ActionTileBrightness.light,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: padding,
      tileColor: backgroundColor,
      title: Text(title, style: _buildTitleStyle()),
      subtitle: subtitle != null
          ? Text(
              subtitle ?? '',
              style: _buildSubtitleStyle(),
            )
          : null,
      leading: prefixIcon != null ? Icon(prefixIcon, color: iconColor) : null,
      trailing: suffixIcon != null ? Icon(suffixIcon, color: iconColor) : null,
    );
  }

  TextStyle _buildTitleStyle() {
    if (brightness == ActionTileBrightness.light) {
      return subtitle == null
          ? AppTextStyles.titleBlack
          : AppTextStyles.subtitleBlack;
    }

    return subtitle == null
        ? AppTextStyles.titleWhite
        : AppTextStyles.subtitleWhite;
  }

  TextStyle _buildSubtitleStyle() {
    if (brightness == ActionTileBrightness.light) {
      return AppTextStyles.titleBlack;
    }

    return AppTextStyles.titleWhite;
  }
}
