library color_chooser;

import 'package:flutter/material.dart';

class SubColorChooserScreenDesktop extends StatefulWidget {
  const SubColorChooserScreenDesktop({
    required this.color,
    required this.title,
    required this.changeColorFunction,
    Key? key,
  }) : super(key: key);

  /// The Color of which this Screens
  /// showns the different shades.
  final Color color;

  /// The Title of this Screen shown in the
  /// AppBar.
  final String title;

  /// The Function called to change
  /// the Color of the App.
  final void Function(Color) changeColorFunction;

  @override
  State<SubColorChooserScreenDesktop> createState() =>
      _SubColorChooserScreenDesktopState();
}

class _SubColorChooserScreenDesktopState
    extends State<SubColorChooserScreenDesktop> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
