import 'package:flutter/material.dart';

import '../utils/appConstants.dart';
import '../utils/appTextStyles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool showBackButton;
  final bool showPrefixIcon;
  final VoidCallback? onPrefixIconPressed;

  CustomAppBar({
    required this.title,
    this.prefixIcon,
    this.suffixIcon,
    this.showBackButton = true,
    this.showPrefixIcon = false,
    this.onPrefixIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      leading: showBackButton
          ? IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      )
          : null,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: AppTextStyles.poppinsMedium(
          fontSize: 20.0,
          color: Colors.black,
          textAlign: TextAlign.center,
        ),
      ),
      centerTitle: true,
      actions: [
        if (showPrefixIcon && prefixIcon != null)
          IconButton(
            icon: prefixIcon!,
            onPressed: onPrefixIconPressed,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}