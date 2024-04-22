import 'package:flutter/material.dart';
import 'package:shoes_shopping_app/core/common/widgets/my_snack_bar.dart';

extension ContextExtentions on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get scheme => Theme.of(this).colorScheme;

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
      String message) {
    return ScaffoldMessenger.of(this).showSnackBar(
      mySnackBar(message),
    );
  }
}
