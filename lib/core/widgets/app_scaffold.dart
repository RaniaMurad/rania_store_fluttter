import 'package:flutter/material.dart';
import 'package:rania_store/core/theme/app_colors.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final Color? backgroundColor;
  final Widget? leading;
  const AppScaffold({
    super.key,
    required this.body,
    required this.title,
    this.backgroundColor,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      // ================= APP BAR =================
      appBar: AppBar(title: Text(title), leading: leading),

      body: body,
    );
  }
}
