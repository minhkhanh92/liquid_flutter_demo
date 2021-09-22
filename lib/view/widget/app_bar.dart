import 'package:flutter/material.dart';
import 'package:liquid_demo/liquid.dart';

class LAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;

  LAppBar({
    required this.title,
    this.leading,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
        leading: leading,
        title: Text(title,
            style: theme.textTheme.headline6
                ?.copyWith(color: theme.appBarTheme.foregroundColor)),
        centerTitle: true,
        actions: actions);
  }

  @override
  Size get preferredSize => const Size.fromHeight(LDimens.appBarHeight);
}
