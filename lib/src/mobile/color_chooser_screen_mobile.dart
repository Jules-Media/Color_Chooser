library color_chooser;

import 'package:color_chooser/src/color_tile_position.dart';
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
/// The length of the [colors] List should be dividable by 3,
/// because there's always 3 Color Tiles in one Row.
/// If this is not the case, the Background Color of this
/// current Theme will be added to the List.
/// So it is dividable by 3, and the Screen can handle it,
/// but for the User it looks like it just fades away.
class ColorChooserScreenMobile extends StatefulWidget {
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
  State<StatefulWidget> createState() => _ColorChooserState();
}

class _ColorChooserState extends State<ColorChooserScreenMobile> {
  @override
  void initState() {
    while (widget.colors.length % 3 != 0) {
      widget.colors.add(
        Theme.of(context).scaffoldBackgroundColor,
      );
    }
    super.initState();
  }

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
        itemCount: widget.colors.length,
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
            colorRight = widget.colors[counter + 1];
          } else if (counter % 3 == 1) {
            pos = ColorTilePosition.middle;
            colorLeft = widget.colors[counter - 1];
            colorRight = widget.colors[counter + 1];
          } else if (counter % 3 == 2) {
            pos = ColorTilePosition.right;
            colorLeft = widget.colors[counter - 1];
          } else {
            throw Exception('Unexpected Positioning of Color Tile.');
          }

          return ColorTile(
            color: widget.colors[counter],
            colorLeft: colorLeft,
            colorRight: colorRight,
            position: pos,
            widgetTitle: widget.title,
          );
        },
      ),
    );
  }
}
