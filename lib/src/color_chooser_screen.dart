library color_chooser;

import 'dart:io' show Platform;

import 'package:color_chooser/color_chooser.dart';
import 'package:flutter/material.dart';
import 'package:helpful_extensions/helpful_extensions.dart';

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

/// The Red Color Shades.
@protected
final List<Color> redColors = [
  Colors.red.shade50,
  Colors.red.shade100,
  Colors.red.shade200,
  Colors.redAccent.shade100,
  Colors.red.shade300,
  Colors.redAccent.shade200,
  Colors.red.shade400,
  Colors.red,
  Colors.red.shade500,
  Colors.red.shade600,
  Colors.redAccent.shade400,
  Colors.red.shade700,
  Colors.red.shade800,
  Colors.redAccent.shade700,
  Colors.red.shade900,
];

/// The Pink Color Shades.
@protected
final List<Color> pinkColors = [
  Colors.pink.shade50,
  Colors.pink.shade100,
  Colors.pink.shade200,
  Colors.pink.shade300,
  Colors.pinkAccent.shade100,
  Colors.pinkAccent.shade200,
  Colors.pinkAccent.shade400,
  Colors.pinkAccent.shade700,
  Colors.pink.shade400,
  Colors.pink,
  Colors.pink.shade500,
  Colors.pink.shade600,
  Colors.pink.shade700,
  Colors.pink.shade800,
  Colors.pink.shade900,
];

/// The Purple Color Shades.
@protected
final List<Color> purpleColors = [
  Colors.purple.shade50,
  Colors.purple.shade100,
  Colors.purple.shade200,
  Colors.purple.shade300,
  Colors.purpleAccent.shade100,
  Colors.purpleAccent.shade200,
  Colors.purpleAccent.shade400,
  Colors.purpleAccent.shade700,
  Colors.purple.shade400,
  Colors.purple,
  Colors.purple.shade500,
  Colors.purple.shade600,
  Colors.purple.shade700,
  Colors.purple.shade800,
  Colors.purple.shade900,
];

/// The Yellow Color Shades.
@protected
final List<Color> yellowColors = [
  Colors.yellow.shade50,
  Colors.yellow.shade100,
  Colors.yellow.shade200,
  Colors.yellow.shade300,
  Colors.yellowAccent.shade100,
  Colors.yellowAccent.shade200,
  Colors.yellowAccent.shade400,
  Colors.yellowAccent.shade700,
  Colors.yellow.shade400,
  Colors.yellow,
  Colors.yellow.shade500,
  Colors.yellow.shade600,
  Colors.yellow.shade700,
  Colors.yellow.shade800,
  Colors.yellow.shade900,
];

/// The Amber Color Shades.
@protected
final List<Color> amberColors = [
  Colors.amber.shade50,
  Colors.amber.shade100,
  Colors.amber.shade200,
  Colors.amber.shade300,
  Colors.amberAccent.shade100,
  Colors.amberAccent.shade200,
  Colors.amberAccent.shade400,
  Colors.amberAccent.shade700,
  Colors.amber.shade400,
  Colors.amber,
  Colors.amber.shade500,
  Colors.amber.shade600,
  Colors.amber.shade700,
  Colors.amber.shade800,
  Colors.amber.shade900,
];

/// The Orange Color Shades.
@protected
final List<Color> orangeColors = [
  Colors.orange.shade100,
  Colors.orange.shade200,
  Colors.orange.shade300,
  Colors.orangeAccent.shade100,
  Colors.orangeAccent.shade200,
  Colors.orangeAccent.shade400,
  Colors.orange.shade400,
  Colors.orange,
  Colors.orange.shade500,
  Colors.orange.shade600,
  Colors.orange.shade700,
  Colors.orange.shade800,
  Colors.deepOrange.shade100,
  Colors.deepOrange.shade200,
  Colors.deepOrange.shade300,
  Colors.orangeAccent.shade700,
  Colors.orange.shade900,
  Colors.deepOrangeAccent.shade100,
  Colors.deepOrangeAccent.shade200,
  Colors.deepOrange,
  Colors.deepOrange.shade500,
  Colors.deepOrange.shade600,
  Colors.deepOrange.shade700,
  Colors.deepOrange.shade800,
  Colors.deepOrange.shade900,
  Colors.deepOrangeAccent.shade400,
  Colors.deepOrangeAccent.shade700,
];

/// The Lime Color Shades.
@protected
final List<Color> limeColors = [
  Colors.lime.shade50,
  Colors.lime.shade100,
  Colors.lime.shade200,
  Colors.limeAccent.shade100,
  Colors.lime.shade300,
  Colors.lime.shade400,
  Colors.limeAccent.shade200,
  Colors.limeAccent.shade400,
  Colors.limeAccent.shade700,
  Colors.lime,
  Colors.lime.shade500,
  Colors.lime.shade600,
  Colors.lime.shade700,
  Colors.lime.shade800,
  Colors.lime.shade900,
];

/// The Green Color Shades.
@protected
final List<Color> greenColors = [
  Colors.green.shade100,
  Colors.green.shade200,
  Colors.green.shade300,
  Colors.lightGreen.shade100,
  Colors.lightGreenAccent.shade100,
  Colors.lightGreen.shade200,
  Colors.lightGreen.shade300,
  Colors.greenAccent.shade100,
  Colors.greenAccent.shade200,
  Colors.greenAccent.shade400,
  Colors.greenAccent.shade700,
  Colors.green.shade400,
  Colors.green,
  Colors.green.shade500,
  Colors.green.shade600,
  Colors.green.shade700,
  Colors.green.shade800,
  Colors.green.shade900,
  Colors.lightGreenAccent.shade200,
  Colors.lightGreenAccent.shade400,
  Colors.lightGreenAccent.shade700,
  Colors.lightGreen.shade400,
  Colors.lightGreen,
  Colors.lightGreen.shade500,
  Colors.lightGreen.shade600,
  Colors.lightGreen.shade700,
  Colors.lightGreen.shade900,
];

/// The Teal Color Shades.
@protected
final List<Color> tealColors = [
  Colors.teal.shade50,
  Colors.teal.shade100,
  Colors.tealAccent.shade100,
  Colors.teal.shade200,
  Colors.tealAccent.shade200,
  Colors.tealAccent.shade400,
  Colors.tealAccent.shade700,
  Colors.teal.shade300,
  Colors.teal.shade400,
  Colors.teal,
  Colors.teal.shade500,
  Colors.teal.shade600,
  Colors.teal.shade700,
  Colors.teal.shade800,
  Colors.teal.shade900,
];

/// The Indigo Color Shades.
@protected
final List<Color> indigoColors = [
  Colors.indigo.shade50,
  Colors.indigo.shade100,
  Colors.indigo.shade200,
  Colors.indigo.shade300,
  Colors.indigoAccent.shade100,
  Colors.indigoAccent.shade200,
  Colors.indigoAccent.shade400,
  Colors.indigoAccent.shade700,
  Colors.indigo.shade400,
  Colors.indigo,
  Colors.indigo.shade500,
  Colors.indigo.shade600,
  Colors.indigo.shade700,
  Colors.indigo.shade800,
  Colors.indigo.shade900,
];

/// The Blue Color Shades.
@protected
final List<Color> blueColors = [
  Colors.lightBlueAccent.shade100,
  Colors.blue.shade100,
  Colors.blue.shade200,
  Colors.lightBlue.shade200,
  Colors.blueAccent.shade100,
  Colors.blue.shade300,
  Colors.lightBlue.shade300,
  Colors.lightBlue.shade400,
  Colors.lightBlue,
  Colors.lightBlue.shade500,
  Colors.blue.shade400,
  Colors.lightBlue.shade600,
  Colors.lightBlueAccent.shade200,
  Colors.lightBlueAccent.shade400,
  Colors.lightBlueAccent.shade700,
  Colors.blue,
  Colors.blueAccent.shade200,
  Colors.blue.shade500,
  Colors.blue.shade600,
  Colors.lightBlue.shade700,
  Colors.lightBlue.shade800,
  Colors.blue.shade700,
  Colors.blueAccent.shade400,
  Colors.blueAccent.shade700,
  Colors.blue.shade800,
  Colors.lightBlue.shade900,
  Colors.blue.shade900,
];

/// The Cyan Color Shades.
@protected
final List<Color> cyanColors = [
  Colors.cyan.shade50,
  Colors.cyan.shade100,
  Colors.cyan.shade200,
  Colors.cyanAccent.shade100,
  Colors.cyan.shade300,
  Colors.cyanAccent.shade200,
  Colors.cyanAccent.shade400,
  Colors.cyan.shade400,
  Colors.cyan,
  Colors.cyanAccent.shade700,
  Colors.cyan.shade500,
  Colors.cyan.shade600,
  Colors.cyan.shade700,
  Colors.cyan.shade800,
  Colors.cyan.shade900,
];

/// The Brown Color Shades.
@protected
final List<Color> brownColors = [
  Colors.brown.shade50,
  Colors.brown.shade100,
  Colors.brown.shade200,
  Colors.brown.shade300,
  Colors.brown.shade400,
  Colors.brown,
  Colors.brown.shade500,
  Colors.brown.shade600,
  Colors.brown.shade700,
  Colors.brown.shade800,
  Colors.brown.shade900,
];

/// Returns all the internal
/// Colors.
///
/// The normal as much as the shapes of
/// it.
List<Color> getAllInternalColors(Color backgroundColor) {
  final List<Color> list = [];
  for (Color color in colors) {
    final List<Color> l = [];
    l.add(color);
    l.addAll(shapesOfColor(color));
    l.colorSort(optionsForColor(color));
    list.addAll(l);
  }

  while (list.length % 3 != 0) {
    list.add(backgroundColor);
  }

  return list;
}

/// Returns the shapes of
/// the specified [color]
List<Color> shapesOfColor(Color color) {
  final List<Color> colors;
  if (color == Colors.amber) {
    colors = amberColors;
  } else if (color == Colors.blue) {
    colors = blueColors;
  } else if (color == Colors.cyan) {
    colors = cyanColors;
  } else if (color == Colors.orange) {
    colors = orangeColors;
  } else if (color == Colors.green) {
    colors = greenColors;
  } else if (color == Colors.purple) {
    colors = purpleColors;
  } else if (color == Colors.indigo) {
    colors = indigoColors;
  } else if (color == Colors.lime) {
    colors = limeColors;
  } else if (color == Colors.teal) {
    colors = tealColors;
  } else if (color == Colors.yellow) {
    colors = yellowColors;
  } else if (color == Colors.red) {
    colors = redColors;
  } else if (color == Colors.brown || color == Colors.black) {
    colors = brownColors;
  } else if (color == Colors.pink) {
    colors = pinkColors;
  } else {
    colors = [color];
  }
  return colors;
}

/// Returns the Color Chooser Screen depending on the current
/// Operating System.
class ColorChooserScreen extends StatelessWidget {
  ColorChooserScreen({
    required this.changeColorFunction,
    this.title = 'Choose a Color',
    this.actionToolTip = 'Extend List',
    this.colors,
    Key? key,
  }) : super(key: key) {
    _isD = _isDesktop;
  }

  /// The Function called to change the
  /// Color of the App.
  /// Is called after going through color Chooser
  /// and Sub Color Chooser
  final void Function(Color color) changeColorFunction;

  /// The Title of the Color Chooser
  final String title;

  /// The Tooltip for the
  /// action to extend the
  /// list of colors.
  final String actionToolTip;

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
    this.actionToolTip = 'Extend List',
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
        actionToolTip: actionToolTip,
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
