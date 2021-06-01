import 'package:flutter/material.dart';

import '../../helpers/services_helper.dart';
import 'action_tile.dart';

class EmailTile extends StatelessWidget {
  final String title;
  final String email;
  final bool useInitials;

  const EmailTile({
    this.title = 'Email para contato',
    required this.email,
    this.useInitials = false,
  });

  @override
  Widget build(BuildContext context) {
    return ActionTile(
      title: title,
      subtitle: email,
      prefixIcon: Icons.email_outlined,
      suffixIcon: Icons.navigate_next,
      onTap: () => ServicesHelper.sendEmail(email),
    );
  }
}
