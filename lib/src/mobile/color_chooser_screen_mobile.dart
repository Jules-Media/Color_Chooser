library color_chooser;

import '../color_chooser_screen.dart' show colors;
import '../color_tile_position.dart';
import 'color_tile.dart';
import 'sub_color_chooser_screen_mobile.dart';

import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:flutter/material.dart';

/// The Mobile Version of this Color Chooser
/// The length of the [colors] List should be dividable by 3,
/// because there's always 3 Color Tiles in one Row.
/// If this is not the case, the Background Color of this
/// current Theme will be added to the List.
/// So it is dividable by 3, and the Screen can handle it,
/// but for the User it looks like it just fades away.
class ColorChooserScreenMobile extends StatefulWidget {
  const ColorChooserScreenMobile({
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
  final void Function(Color color) changeColorFunction;

  @override
  State<StatefulWidget> createState() => _ColorChooserState();
}

class _ColorChooserState extends State<ColorChooserScreenMobile> {
  /// The Colors shown in this Color Chooser
  /// Screen.
  /// If you don't specifiy this, the default
  /// Color List, that is packed with this
  /// package is used.
  late final List<Color> _interalColors;

  /// The current Background Color
  /// of the Screen.
  late Color backgroundColor;

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
    return Scaffold(
      appBar: _appBar,
      body: _body,
    );
  }

  /// The Appbar of this Screen.
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
        itemCount: _interalColors.length,
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
          final ColorTilePosition pos;
          Color? colorLeft;
          Color? colorRight;

          if (counter % 3 == 0) {
            pos = ColorTilePosition.left;
            colorRight = _interalColors[counter + 1];
          } else if (counter % 3 == 1) {
            pos = ColorTilePosition.middle;
            colorLeft = _interalColors[counter - 1];
            colorRight = _interalColors[counter + 1];
          } else if (counter % 3 == 2) {
            pos = ColorTilePosition.right;
            colorLeft = _interalColors[counter - 1];
          } else {
            throw Exception('Unexpected Positioning of Color Tile.');
          }

          return ColorTile(
            color: _interalColors[counter],
            colorLeft: colorLeft,
            colorRight: colorRight,
            position: pos,
            onTap: (c) => _openSubColorChooser(c),
          );
        },
      ),
    );
  }

  /// Opens the Sub Color Chooser
  /// Screen.
  /// The [color] is the color the User pressed on this Screen.
  void _openSubColorChooser(Color color) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SubColorChooserScreenMobile(
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
