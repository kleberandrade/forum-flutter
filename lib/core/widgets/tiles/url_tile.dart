import 'package:flutter/material.dart';

import '../../helpers/services_helper.dart';
import 'action_tile.dart';

class UrlTile extends StatelessWidget {
  final String title;
  final String url;

  UrlTile({
    this.title = 'Site oficial',
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return ActionTile(
      title: title,
      subtitle: url,
      prefixIcon: Icons.public_outlined,
      suffixIcon: Icons.navigate_next,
      onTap: () => ServicesHelper.openUrl(url),
    );
  }
}
