library color_chooser;

import 'dart:io' show Platform;

import 'package:color_chooser/color_chooser.dart';
import 'package:flutter/material.dart';

/// All the Colors.
@protected
final colors = <Color>[
  Colors.red,
  Colors.pink,
  Colors.purple,
  Colors.yellow,
  Colors.amber,
  Colors.orange,
  Colors.lime,
  Colors.green,
  Colors.teal,
  Colors.indigo,
  Colors.blue,
  Colors.cyan,
  Colors.brown,
  Colors.black,
];

/// Returns the Color Chooser Screen depending on the current
/// Operating System.
class ColorChooserScreen extends StatelessWidget {
  ColorChooserScreen({
    required this.changeColorFunction,
    this.title = 'Choose a Color',
    this.colors,
    Key? key,
  }) : super(key: key) {
    _isD = _isDesktop;
  }

  /// The Function called to change the
  /// Color of the App.
  /// Is called after going through color Chooser
  /// and Sub Color Chooser
  final void Function(Color) changeColorFunction;

  /// The Title of the Color Chooser
  final String title;

  /// The Colors shown in this Color Chooser
  /// Screen.
  /// If you don't specifiy this, the default
  /// Color List, that is packed with this
  /// package is used.
  final List<Color>? colors;

  /// Whether the App is running on a
  /// Desktop OS or not.
  late final bool _isD;

  /// Returns the Color Chooser depending on
  /// a passed Operating System.
  ///
  /// You can eigther pass [isDesktop],
  /// with which you can determine
  ColorChooserScreen.withOS({
    bool? isDesktop,
    String? os,
    this.title = 'Choose a Color',
    this.colors,
    required this.changeColorFunction,
    Key? key,
  })  : assert((isDesktop != null && os == null) ||
            (isDesktop == null && os != null)),
        super(key: key) {
    if (os != null) {
      _isD = _osPlatform(os);
    } else {
      _isD = isDesktop!;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isD) {
      return ColorChooserScreenDesktop(
        changeColorFunction: changeColorFunction,
        title: title,
        colors: colors,
        key: key,
      );
    } else {
      return ColorChooserScreenMobile(
        changeColorFunction: changeColorFunction,
        title: title,
        colors: colors,
        key: key,
      );
    }
  }

  /// All the Desktop Operating Systems.
  static const Set<String> _desktopOS = {'macos', 'windows', 'linux'};

  /// Whether this App is running on a
  /// Desktop Operating System or not.
  bool _osPlatform(String os) {
    return _desktopOS.contains(os);
  }

  /// Whether the App is running on a
  /// Desktop OS or not.
  bool get _isDesktop {
    return _desktopOS.contains(Platform.operatingSystem);
  }
}
