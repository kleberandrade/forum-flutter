import 'package:flutter/material.dart';

class HeaderTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final double size;
  final EdgeInsets padding;
  final Color color;
  final Color backgroundColor;

  const HeaderTile({
    required this.title,
    this.subtitle,
    this.size = 16,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
    this.color = Colors.black,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: backgroundColor,
      contentPadding: padding,
      title: Text(
        title,
        textAlign: TextAlign.justify,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle ?? '',
              style: Theme.of(context).textTheme.caption,
            )
          : null,
    );
  }
}
