import 'package:flutter/material.dart';

import '../utils/appTextStyles.dart';

class CustomBorderedTextField extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function(String)? onSubmitted;
  final Function()? onSuffixIconPressed; // Callback for suffix icon press
  final TextEditingController? controller;

  const CustomBorderedTextField({
    Key? key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSubmitted,
    this.onSuffixIconPressed,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.poppinsRegular(
          fontSize: 15.0,
          color: Colors.black.withOpacity(0.4),
          textAlign: TextAlign.center,
        ),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Colors.black) : null,
        suffixIcon: suffixIcon != null
            ? IconButton(
          icon: Icon(suffixIcon, color: Colors.black),
          onPressed: onSuffixIconPressed,
        )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 2.0,
          ),
        ),
      ),
      onSubmitted: onSubmitted,
      style:  AppTextStyles.poppinsMedium(
        fontSize: 15.0,
        color: Colors.black,
        textAlign: TextAlign.center,
      ),
    );
  }
}