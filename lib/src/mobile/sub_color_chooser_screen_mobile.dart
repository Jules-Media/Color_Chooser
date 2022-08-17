library color_chooser;

import 'color_chooser_screen_mobile.dart';

import 'package:flutter/material.dart';

final List<Color> _redColors = [
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

final List<Color> _pinkColors = [
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

final List<Color> _purpleColors = [
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

final List<Color> _yellowColors = [
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

final List<Color> _amberColors = [
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

final List<Color> _orangeColors = [
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

final List<Color> _limeColors = [
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

final List<Color> _greenColors = [
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

final List<Color> _tealColors = [
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

final List<Color> _indigoColors = [
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

final List<Color> _blueColors = [
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

final List<Color?> _cyanColors = [
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
  null,
];

final List<Color?> _brownColors = [
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
  null,
];

/// The Sub Color Chooser Screen.
/// Only used in this Package.
/// The [color] is the Color the User
/// tapped on the [ColorChooserScreenMobile].
/// It's used to determine the shades shown on this Screen
@protected
class SubColorChooserScreenMobile extends StatelessWidget {
  const SubColorChooserScreenMobile({
    required this.color,
    Key? key,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
