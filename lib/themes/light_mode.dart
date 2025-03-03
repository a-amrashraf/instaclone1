import "package:flutter/material.dart";

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Colors.white, // Background color
    primary: Colors.black, // Main text color (used for icons and text)
    secondary: Colors.grey.shade100,
    tertiary: Colors.grey.shade500, // Card background or containers
    inversePrimary:
        Colors.blue.shade300, // Action button color (like follow button)
  ),
);
