import 'package:flutter/material.dart';

import '../utils/appTextStyles.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData? suffixIcon;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onIconPressed;
  final bool obscureText;

  CustomTextField({
    required this.hintText,
    required this.suffixIcon,
    this.onChanged,
    this.onIconPressed,
    this.obscureText = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return       Container(decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.black.withOpacity(0.3)),
    ),
      child: TextField(
        style: AppTextStyles.poppinsMedium(
          fontSize: 16.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon != null ? Icon(widget.suffixIcon) : SizedBox(),
          hintText: widget.hintText,hintStyle: AppTextStyles.poppinsMedium(
          fontSize: 14.0,
          color: Colors.black.withOpacity(0.5),
        ),border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),),),
    );
  }
}
