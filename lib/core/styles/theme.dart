import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

InputDecoration otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 20),
  border: outlineInputBorder,
  focusedBorder: outlineInputBorder,
  enabledBorder: outlineInputBorder,
);

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: myBorderRadius,
  borderSide: const BorderSide(color: darkGray),
  gapPadding: 10,
);

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  floatingLabelBehavior: FloatingLabelBehavior.auto,
  enabledBorder: outlineInputBorder,
  focusedBorder: outlineInputBorder,
  border: outlineInputBorder,
  hintStyle: const TextStyle(fontSize: 14, color: gray),
);

AppBarTheme appBarTheme = const AppBarTheme(
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ),
  backgroundColor: Colors.transparent,
  elevation: 0,
  iconTheme: IconThemeData(color: Colors.black),
  titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
  centerTitle: true,
);

TextStyle buttonTextStyle = const TextStyle(
  fontSize: 16,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

BoxShadow myBoxShadow = const BoxShadow(
  color: Colors.black12,
  offset: Offset(3, 3), //Offset
  blurRadius: 10,
);

BorderRadius myBorderRadius = BorderRadius.circular(16.0);

SvgPicture myIcon(
  String icon, {
  Color color = dark,
  double size = 24,
  BlendMode blendMode = BlendMode.srcIn,
}) {
  return SvgPicture.asset(
    icon,
    colorFilter: ColorFilter.mode(
      color,
      blendMode,
    ),
    width: size,
    height: size,
  );
}

const primary = Color(0xFFFF7643);
const primaryLight = Color(0xFFFFECDF);
const secondary = Color(0xFFAAA6D6);
const secondaryLight = Color(0xFFF4F5FC);
const light = Color(0xFFF5F6F9);
const dark = Color(0xFF1A191C);
const gray = Color(0xFF979797);
const darkGray = Color(0xFF757575); // textColor
const orangeGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [primaryLight, primary],
);

class MyTheme {
  static final lightTheme = ThemeData(
    fontFamily: 'Muli',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: appBarTheme,
    inputDecorationTheme: inputDecorationTheme,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      labelLarge: TextStyle(fontSize: 12),
      labelMedium: TextStyle(fontSize: 11),
      labelSmall: TextStyle(fontSize: 10),
    ).apply(displayColor: Colors.black),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: buttonTextStyle,
        backgroundColor: primary,
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: myBorderRadius,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: buttonTextStyle,
        padding: const EdgeInsets.all(20),
        foregroundColor: primary,
        side: const BorderSide(color: primary),
        shape: RoundedRectangleBorder(
          borderRadius: myBorderRadius,
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
