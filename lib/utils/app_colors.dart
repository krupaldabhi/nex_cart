import 'package:flutter/material.dart';

class AppColors {
  // Primary Brand Colors
  static const Color primaryBlue = Color(0xFF1E88FF);
  static const Color darkNavy = Color(0xFF001F5B);

  // Secondary Colors
  static const Color lightBlue = Color(0xFF4DA3FF);
  static const Color skyBlue = Color(0xFF69B7FF);

  // Background Colors
  static const Color screenBackground = Color(0xFFF8FAFC);
  static const Color white = Colors.white;
  static const Color scaffoldBackground = Color(0xFFF8FAFC);

  // Text Colors
  static const Color black = Color(0xFF121212);
  static const Color darkText = Color(0xFF1A1A1A);
  static const Color greyText = Color(0xFF6B7280);

  // Border & Divider
  static const Color border = Color(0xFFE5E7EB);
  static const Color divider = Color(0xFFF1F5F9);

  // Status Colors
  static const Color success = Color(0xFF22C55E);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);

  // Button Colors
  static const Color buttonPrimary = primaryBlue;
  static const Color buttonSecondary = darkNavy;

  // Card Colors
  static const Color cardColor = Colors.white;

  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFF1E88FF),
      Color(0xFF0052D4),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Shadow
  static Color shadowColor = Colors.black.withOpacity(0.08);
}