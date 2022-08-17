library color_chooser;

import '../color_tile_position.dart';
import 'sub_color_chooser_screen_mobile.dart';

import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:flutter/material.dart';

/// Container to represent a single [color].
/// This is always used in a Grid of 3 Colors in
/// one Row.
/// So you have 3 options where this Tile is positioned.
/// This is done through the [position] argument of this Widget.
///
/// [ColorTilePosition.left] should be used if this Color is on the
/// left side of the Screen. If you use that, you have to specifiy the optional
/// argument [colorRight] and pass the Colors right next to it.
///
/// [ColorTilePosition.middle] should be used if this Color is in the
/// middle of the Screen. If used, you have to specify both optional arguments
/// [colorLeft] and [colorRight].
///
/// [ColorTilePosition.right] should be used if this Color is on the right side
/// the Screen. If used, you have to specify the optional argument
/// [colorLeft] and pass the Color right on the left side of this Widget.
///
/// Passing color Arguments and [position] arguments that does not match,
/// it will resolve in an Error.
@protected
class ColorTile extends StatefulWidget {
  const ColorTile({
    required this.color,
    required this.position,
    this.colorRight,
    this.colorLeft,
    required this.widgetTitle,
    Key? key,
  })  : assert(
          (position == ColorTilePosition.left &&
                  colorRight != null &&
                  colorLeft == null) ||
              (position == ColorTilePosition.middle &&
                  colorLeft != null &&
                  colorRight != null) ||
              (position == ColorTilePosition.right &&
                  colorLeft != null &&
                  colorRight == null),
          'You have to specifiy the right Colors depending on the Position of your Color Tile. See the Documentation for more.',
        ),
        super(key: key);

  /// The Color this Tile
  /// should represents.
  final Color color;

  /// The Color to the Left of this Tile
  final Color? colorLeft;

  /// The Color to the right of this Tile.
  final Color? colorRight;

  /// The Position of this Color Tile.
  final ColorTilePosition position;

  /// The Title of the Color Chooser Screen.
  /// This has to be passed, because the Sub Color Chooser needs
  /// it to display it's title.
  /// And this is called from here, so this Argument is required.
  final String widgetTitle;

  @override
  State<StatefulWidget> createState() => _ColorTileState();
}

class _ColorTileState extends State<ColorTile> {
  late final Size size;

  @override
  void initState() {
    size = MediaQuery.of(context).size;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width / 3,
      height: size.width / 3,
      child: GestureDetector(
        behavior: HitTestBehavior.deferToChild,
        dragStartBehavior: DragStartBehavior.down,
        onTap: _openSubColorChooser,
        child: GridTile(
          footer: Text(
            widget.color.value.toRadixString(16).padLeft(11, ' '),
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              backgroundBlendMode: BlendMode.src,
              gradient: _gradient,
            ),
            position: DecorationPosition.background,
          ),
        ),
      ),
    );
  }

  /// The Gradient of this Tile.
  Gradient get _gradient {
    final Gradient gradient;

    switch (widget.position) {
      case ColorTilePosition.left:
        gradient = LinearGradient(
          colors: [
            widget.color,
            widget.colorRight!,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: const [0.4, 0.6],
          tileMode: TileMode.clamp,
        );
        break;

      case ColorTilePosition.middle:
        gradient = LinearGradient(
          colors: [
            widget.colorLeft!,
            widget.color,
            widget.colorRight!,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: const [0.1, 0.5, 1.0],
          tileMode: TileMode.clamp,
        );
        break;

      case ColorTilePosition.right:
        gradient = LinearGradient(
          colors: [
            widget.colorLeft!,
            widget.color,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: const [0.4, 0.6],
          tileMode: TileMode.clamp,
        );
        break;

      default:
        throw Exception('Unexpected enum Value');
    }
    return gradient;
  }

  /// Opens the sub Color Chooser Screen and passes
  /// the color Argument.
  void _openSubColorChooser() {
    if (widget.color == Theme.of(context).scaffoldBackgroundColor) {
      return;
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => SubColorChooserScreenMobile(
            color: widget.color,
            title: widget.widgetTitle,
          ),
        ),
      );
    }
  }
}
