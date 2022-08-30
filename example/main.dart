library color_chooser;

import 'package:color_chooser/color_chooser.dart' show ColorChooserScreenMobile;
import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorChooserScreenMobile(
        changeColorFunction: (c) {
          // ignore: avoid_print
          print(c.toString());
        },
      ),
    );
  }
}
