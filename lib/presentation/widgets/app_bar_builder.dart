import 'package:flutter/material.dart';
import '../../core/config/design_config.dart';

class AppBarBuilder extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool automaticallyImplyLeading;

  const AppBarBuilder({
    super.key,
    required this.title,
    this.automaticallyImplyLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: DesignConfig.appBarBackgroundColor,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: DesignConfig.textColor,
          fontSize: DesignConfig.headerSize,
          fontFamily: DesignConfig.fontFamily,
          fontWeight: DesignConfig.semiBold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
