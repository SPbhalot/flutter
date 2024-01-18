
import 'package:flutter/material.dart';

class AppUtils {
  static void showToast(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static void navigateToPage(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }
}
