library color_chooser;

import 'package:color_chooser/src/mobile/color_tile.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:flutter/material.dart';

/// All the Colors.
const _colors = <Color>[
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

/// The Mobile Version of this Color Chooser
class ColorChooserScreenMobile extends StatelessWidget {
  const ColorChooserScreenMobile({
    this.title = 'Choose a Color',
    this.colors = _colors,
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
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _body,
    );
  }

  /// The Appbar of this Screen.
  AppBar get _appBar {
    return AppBar(
      automaticallyImplyLeading: true,
      title: Text(title),
    );
  }

  /// The Body of this Screen.
  Widget get _body {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: _colors.length,
      reverse: false,
      addAutomaticKeepAlives: true,
      addRepaintBoundaries: true,
      addSemanticIndexes: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      dragStartBehavior: DragStartBehavior.down,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (_, counter) {
        return ColorTile(color: colors[counter]);
      },
    );
  }
}
