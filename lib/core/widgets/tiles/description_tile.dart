import 'package:flutter/material.dart';

class DescriptionTile extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final EdgeInsets padding;
  final Color backgroundColor;

  const DescriptionTile({
    required this.text,
    this.textAlign = TextAlign.justify,
    this.backgroundColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: padding,
      child: Text(
        text,
        textAlign: textAlign,
      ),
    );
  }
}
