import 'package:flash_word/home.dart';
import 'package:flutter/material.dart';

import 'AppThemeData.dart';

void main() => runApp(FlashCard());

class FlashCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppThemeData.light, darkTheme: AppThemeData.dark, home: home());
  }
}
