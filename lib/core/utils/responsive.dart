import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Responsive {
  static bool isWeb(BuildContext context) =>
      kIsWeb && MediaQuery.of(context).size.width > 650;

  static bool isMobile(BuildContext context) =>
      !kIsWeb || MediaQuery.of(context).size.width <= 650;
}
