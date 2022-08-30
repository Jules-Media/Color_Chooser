library color_chooser;

import '../color_chooser_screen.dart' show colors;
import 'sub_color_chooser_desktop.dart';

import 'package:flutter/material.dart';

/// The Desktop Version of this
/// Color Chooser Screen
class ColorChooserScreenDesktop extends StatefulWidget {
  const ColorChooserScreenDesktop({
    required this.changeColorFunction,
    this.title = 'Choose a Color',
    this.colors,
    Key? key,
  }) : super(key: key);

  /// The Title of the AppBar.
  /// This is shown on Top
  /// of the Screen.
  final String title;

  /// The Colors shown in this Color Chooser
  /// Screen.
  /// If you don't specifiy this, the default
  /// Color List, that is packed with this
  /// package is used.
  final List<Color>? colors;

  /// The Function called to change the
  /// Color of the App.
  /// Is called after going through color Chooser
  /// and Sub Color Chooser
  final void Function(Color) changeColorFunction;

  @override
  State<StatefulWidget> createState() => _ColorChooserState();
}

class _ColorChooserState extends State<ColorChooserScreenDesktop> {
  /// The Colors shown in this Color Chooser
  /// Screen.
  /// If you don't specifiy this, the default
  /// Color List, that is packed with this
  /// package is used.
  late final List<Color> _interalColors;

  /// The current Background Color
  /// of the Screen.
  late final Color backgroundColor;

  @override
  void initState() {
    _interalColors = widget.colors ?? colors;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    while (_interalColors.length % 3 != 0) {
      _interalColors.add(backgroundColor);
    }
    return const Scaffold();
  }

  /// Opens the Sub Color Chooser
  /// Screen.
  /// The [color] is the color the User pressed on this Screen.
  void _openSubColorChooser(Color color) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SubColorChooserScreenDesktop(
          color: color,
          changeColorFunction: widget.changeColorFunction,
          title: widget.title,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _interalColors.removeWhere((c) => c == backgroundColor);
    super.dispose();
  }
}
