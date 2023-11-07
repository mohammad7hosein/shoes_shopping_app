import 'package:flutter/material.dart';

SnackBar mySnackBar(BuildContext context, String message) {
  return SnackBar(
    content: Center(child: Text(message)),
    margin: EdgeInsets.fromLTRB(
      20,
      0,
      20,
      MediaQuery.of(context).size.height - 200,
    ),
    padding: const EdgeInsets.all(20),
    duration: const Duration(milliseconds: 1500),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  );
}
