import 'package:flutter/material.dart';

class AppStyles {
  
  static const TextStyle headingTextStyleBlack = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle headingTextStyleWhite = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle smallheadingTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

static const TextStyle smallheadingGreyTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );
  
static const TextStyle descriptionTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  );

static ButtonStyle commonButtonStyle = ElevatedButton.styleFrom(
    backgroundColor : Color(0xF29AD00),
    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
    textStyle: TextStyle(fontSize: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  );

  static const TextStyle bodyTextStyle = TextStyle(
    fontSize: 16,
    color: Colors.black87,
  );
}
