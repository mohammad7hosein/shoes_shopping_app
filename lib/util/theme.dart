import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

InputDecoration otpInputDecoration() {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 20),
    border: outlineInputBorder(),
    focusedBorder: outlineInputBorder(),
    enabledBorder: outlineInputBorder(),
  );
}

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: MyTheme.darkGray),
    gapPadding: 10,
  );
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    contentPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
    enabledBorder: outlineInputBorder(),
    focusedBorder: outlineInputBorder(),
    border: outlineInputBorder(),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
    color: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
    centerTitle: true,
  );
}

class MyTheme {
  static const primary = Color(0xFFFF7643);
  static const primaryLight = Color(0xFFFFECDF);
  static const secondary = Color(0xFFAAA6D6);
  static const secondaryLight = Color(0xFFF4F5FC);
  static const light = Color(0xFFF5F6F9);
  static const dark = Color(0xFF1A191C);
  static const gray = Color(0xFF979797);
  static const darkGray = Color(0xFF757575); // textColor
  static const orangeGradientColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [MyTheme.primaryLight, MyTheme.primary],
  );

  static final lightTheme = ThemeData(
    fontFamily: 'Muli',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: appBarTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
          color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: Colors.black, fontSize: 18),
      bodyMedium: TextStyle(color: Colors.black, fontSize: 16),
      bodySmall: TextStyle(color: Colors.black, fontSize: 14),
      labelLarge: TextStyle(color: Colors.black, fontSize: 12),
      labelMedium: TextStyle(color: Colors.black, fontSize: 11),
      labelSmall: TextStyle(color: Colors.black, fontSize: 10),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        foregroundColor: primary,
        side: const BorderSide(color: primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: primary,
      secondary: secondary,
    ),
    scaffoldBackgroundColor: Colors.white,
    primaryColor: primary,
  );
}
