library color_chooser;

import '../color_tile_position.dart';
import '../color_chooser_screen.dart';
import 'color_chooser_screen_mobile.dart';
import 'color_tile.dart';

import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:flutter/material.dart';

/// The Sub Color Chooser Screen.
/// Only used in this Package.
/// The [color] is the Color the User
/// tapped on the [ColorChooserScreenMobile].
/// It's used to determine the shades shown on this Screen
@protected
class SubColorChooserScreenMobile extends StatefulWidget {
  const SubColorChooserScreenMobile({
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
  final void Function(Color color) changeColorFunction;

  @override
  State<StatefulWidget> createState() => _SubColorChooserState();
}

class _SubColorChooserState extends State<SubColorChooserScreenMobile> {
  /// The Colors represented by this Color Chooser.
  late final List<Color> _colors;

  @override
  void initState() {
    _colors = shapesOfColor(widget.color);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    while (_colors.length % 3 != 0) {
      _colors.add(
        Theme.of(context).scaffoldBackgroundColor,
      );
    }
    return Scaffold(
      appBar: _appBar,
      body: _body,
      extendBody: true,
      extendBodyBehindAppBar: true,
    );
  }

  /// The AppBar of this Screen.
  AppBar get _appBar {
    return AppBar(
      automaticallyImplyLeading: true,
      title: Text(widget.title),
    );
  }

  /// The Body of this Screen.
  Scrollbar get _body {
    return Scrollbar(
      interactive: true,
      scrollbarOrientation: ScrollbarOrientation.right,
      child: GridView.builder(
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
        itemBuilder: (_, count) {
          final ColorTilePosition pos;
          Color? cL;
          Color? cR;

          if (count % 3 == 0) {
            pos = ColorTilePosition.left;
            cR = _colors[count + 1];
          } else if (count % 3 == 1) {
            pos = ColorTilePosition.middle;
            cL = _colors[count - 1];
            cR = _colors[count + 1];
          } else if (count % 3 == 2) {
            pos = ColorTilePosition.right;
            cL = _colors[count - 1];
          } else {
            throw Exception('Unexpected Positioning of Color Tile.');
          }

          return ColorTile(
            color: _colors[count],
            colorLeft: cL,
            colorRight: cR,
            position: pos,
            onTap: (c) {
              widget.changeColorFunction(c);
              for (int i = 0; i < 2; i++) {
                Navigator.pop(context);
              }
            },
          );
        },
      ),
    );
  }
}
