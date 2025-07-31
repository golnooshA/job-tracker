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
    final design = DesignConfig.current;

    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: design.appBarColor,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: design.textColor),
      title: Text(
        title,
        style: TextStyle(
          color: design.textColor,
          fontSize: design.mediumFontSize,
          fontWeight: design.semiBold,
          fontFamily: design.fontFamily,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
