import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoes_shopping_app/core/utils/extensions.dart';

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
  spreadRadius: 2.0,
);

BorderRadius myBorderRadius = BorderRadius.circular(16.0);

SvgPicture myIcon(
  BuildContext context,
  String icon, {
  double? size = 24,
  Color? color,
  BlendMode? blendMode,
}) {
  final themeColor = context.theme.brightness == Brightness.dark
      ? iconColorDark
      : iconColorLight;
  return SvgPicture.asset(
    icon,
    colorFilter: ColorFilter.mode(
      color ?? themeColor,
      blendMode ?? BlendMode.srcIn,
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
const gray = Color(0xFF979797);
const darkGray = Color(0xFF757575);
const iconColorLight = Colors.black87;
const iconColorDark = Colors.white70;
const orangeGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [primaryLight, primary],
);

class MyTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Muli',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: appBarTheme,
    inputDecorationTheme: inputDecorationTheme,
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
      bodySmall: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
      labelLarge: TextStyle(fontSize: 12),
      labelMedium: TextStyle(fontSize: 11),
      labelSmall: TextStyle(fontSize: 10),
    ).apply(
      displayColor: Colors.black87,
      bodyColor: Colors.black87,
      fontFamily: 'Muli',
    ),
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
    iconTheme: const IconThemeData(color: iconColorLight),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: primary,
      primaryContainer: primaryLight,
      onPrimary: Colors.white,
      secondary: secondary,
      secondaryContainer: secondaryLight,
      onSecondary: Colors.black87,
      background: light,
      onBackground: Colors.black87,
      surface: Colors.white,
      onSurface: darkGray,
      shadow: Colors.black12,
    ),
    hintColor: gray,
  );
}
