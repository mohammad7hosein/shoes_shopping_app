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
  labelStyle: const TextStyle(
      fontSize: 16, color: darkGray, fontWeight: FontWeight.bold),
);

TextStyle buttonTextStyle = const TextStyle(
  fontSize: 16,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

BoxShadow myBoxShadow(BuildContext context) => BoxShadow(
      color: context.theme.brightness == Brightness.dark
          ? Colors.grey.shade900
          : Colors.black12,
      offset: const Offset(3, 3), //Offset
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
final secondaryLight = secondary.withOpacity(0.5);
const light = Color(0xFFF6F6F6);
const dark = Color(0xFF19191C);
const veryDark = Color(0xFF121212);
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
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: iconColorLight),
      titleTextStyle: TextStyle(color: Colors.black87, fontSize: 18),
      centerTitle: true,
    ),
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
      brightness: Brightness.light,
    ),
    hintColor: gray,
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Muli',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: iconColorDark),
      titleTextStyle: TextStyle(color: Colors.white70, fontSize: 18),
      centerTitle: true,
    ),
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
      displayColor: Colors.white70,
      bodyColor: Colors.white70,
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
    iconTheme: const IconThemeData(color: iconColorDark),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: primary,
      primaryContainer: primaryLight,
      onPrimary: Colors.white,
      secondary: secondary,
      secondaryContainer: secondaryLight,
      onSecondary: Colors.black87,
      background: dark,
      onBackground: Colors.white70,
      surface: veryDark,
      onSurface: gray,
      shadow: Colors.white10,
      brightness: Brightness.dark,
    ),
    hintColor: darkGray,
  );
}
