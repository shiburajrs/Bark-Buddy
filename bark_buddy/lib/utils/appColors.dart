// color_utils.dart
import 'package:flutter/material.dart';

import '../services/dataRepository/mockDataRepository.dart';

class AppColors {


  static const Color primaryBlack = Color(0xff1a1616);

  // Primary Color
  static const Color softTeal = Color(0xFF5AC8C8);

  // Accent Colors
  static const Color goldenYellow = Color(0xFFFFC107);
  static const Color warmOrange = Color(0xFFFF7043);

  // Neutral Colors
  static const Color lightGray = Color(0xFFF5F5F5);
  static const Color mediumGray = Color(0xFFBDBDBD);
  static const Color darkGray = Color(0xFF424242);

  // Complementary Colors
  static const Color coral = Color(0xFFFF6F61);
  static const Color softBlue = Color(0xFF64B5F6);

  // Background Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color veryLightTeal = Color(0xFFE0F7F7);

  static List<Color> lightAccentColors = [
    Color(0xFF87CEFA), // Light Sky Blue
    Color(0xFFAFEEEE), // Pale Turquoise
    Color(0xFF7FFFD4), // Aquamarine
    Color(0xFF90EE90), // Light Green
    Color(0xFFFFE4E1), // Misty Rose
    Color(0xFFFFB6C1), // Light Pink
    Color(0xFFFFF5EE), // Seashell
    Color(0xFFF0F8FF), // Alice Blue
    Color(0xFFFFF8DC),
    Color(0xFFFFF5F5)//
  ];

  static Color colorForNotificationType(NotificationType type) {
    switch (type) {
      case NotificationType.informational:
        return Color(0xFF2196F3); // Blue
      case NotificationType.transactional:
        return Color(0xFF4CAF50); // Green
      case NotificationType.promotional:
        return Color(0xFFFF9800); // Orange
      case NotificationType.behavioral:
        return Color(0xFF9C27B0); // Purple
      case NotificationType.safetyEmergency:
        return Color(0xFFF44336); // Red
      case NotificationType.socialCommunity:
        return Color(0xFF009688); // Teal
      default:
        return Colors.grey; // Default color
    }
  }

}
