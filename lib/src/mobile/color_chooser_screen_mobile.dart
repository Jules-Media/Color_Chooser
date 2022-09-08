library color_chooser;

import '../color_chooser_screen.dart' show colors, getAllInternalColors;
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

  /// The List with all Colors
  /// used when the User pressed the
  /// extend Button
  late List<Color> _allColors;

  /// The current Background Color
  /// of the Screen.
  late Color backgroundColor;

  /// The Variable that
  /// determines if
  /// this View is extended or not.
  bool isExtended = false;

  @override
  void initState() {
    _interalColors = widget.colors ?? colors;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    _allColors = getAllInternalColors(backgroundColor);
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
      actions: <IconButton>[
        IconButton(
          onPressed: () {
            setState(() {
              isExtended = !isExtended;
            });
          },
          icon: isExtended
              ? const Icon(Icons.expand_less_rounded)
              : const Icon(Icons.expand_more_rounded),
        ),
      ],
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
        itemCount: isExtended ? _allColors.length : _interalColors.length,
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
            colorRight = isExtended
                ? _allColors[counter + 1]
                : _interalColors[counter + 1];
          } else if (counter % 3 == 1) {
            pos = ColorTilePosition.middle;
            colorLeft = isExtended
                ? _allColors[counter - 1]
                : _interalColors[counter - 1];
            colorRight = isExtended
                ? _allColors[counter + 1]
                : _interalColors[counter + 1];
          } else if (counter % 3 == 2) {
            pos = ColorTilePosition.right;
            colorLeft = isExtended
                ? _allColors[counter - 1]
                : _interalColors[counter - 1];
          } else {
            throw Exception('Unexpected Positioning of Color Tile.');
          }

          return ColorTile(
            color: isExtended ? _allColors[counter] : _interalColors[counter],
            colorLeft: colorLeft,
            colorRight: colorRight,
            position: pos,
            onTap: (c) => onTap(c),
          );
        },
      ),
    );
  }

  /// Called when the User taps on the
  void onTap(Color c) {
    if (isExtended) {
      widget.changeColorFunction(c);
      Navigator.pop(context);
    } else {
      _openSubColorChooser(c);
    }
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
