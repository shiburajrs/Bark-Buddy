import 'package:bark_buddy/components/squareLoader.dart';
import 'package:flutter/material.dart';

import '../utils/appColors.dart';
import '../utils/appTextStyles.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final VoidCallback onPressed;

  CustomButton({
    required this.title,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.primaryBlack,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBlack,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: Center(
          child: isLoading
              ?    SequentialSquaresLoader(
            size: 100,
            color: Colors.white,
            duration: Duration(milliseconds: 1200),
          )
              : Text(
            title,
            style: AppTextStyles.poppinsSemiBold(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}