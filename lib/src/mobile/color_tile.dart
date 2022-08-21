library color_chooser;

import '../color_tile_position.dart';

import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:flutter/material.dart';
import 'package:helpful_extensions/helpful_extensions.dart' show ColorMapping;

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
    required this.position,
    required this.color,
    this.colorRight,
    this.colorLeft,
    required this.onTap,
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

  /// The Function called when you tap on this Color Tile.
  final void Function(Color) onTap;

  @override
  State<StatefulWidget> createState() => _ColorTileState();
}

class _ColorTileState extends State<ColorTile> {
  /// The Size of the current Screen.
  Size? size;

  @override
  Widget build(BuildContext context) {
    size ??= MediaQuery.of(context).size;

    return SizedBox(
      width: size!.width / 3,
      height: size!.width / 3,
      child: GestureDetector(
        behavior: HitTestBehavior.deferToChild,
        dragStartBehavior: DragStartBehavior.down,
        onTap: _onTap,
        child: GridTile(
          footer: _footer,
          child: DecoratedBox(
            decoration: BoxDecoration(
              backgroundBlendMode: BlendMode.src,
              gradient: _gradient,
              borderRadius: _borderRadius,
              shape: BoxShape.rectangle,
            ),
            position: DecorationPosition.background,
          ),
        ),
      ),
    );
  }

  /// The Text Style of the Hex Color
  TextStyle get _tStyle {
    return TextStyle(
      color: widget.color.isLight ? Colors.black : Colors.white,
    );
  }

  /// The Footer of the [GridTile]
  Text? get _footer {
    if (widget.color == Theme.of(context).scaffoldBackgroundColor) {
      return null;
    } else {
      return Text(
        widget.color.value.toRadixString(16).padLeft(11, ' '),
        style: _tStyle,
      );
    }
  }

  /// The Border Radius of the Color
  /// Tile depending on its [widget.position]
  BorderRadius get _borderRadius {
    final BorderRadius r;

    switch (widget.position) {
      case ColorTilePosition.left:
        r = const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          topLeft: Radius.circular(25),
        );
        break;

      case ColorTilePosition.middle:
        r = const BorderRadius.all(Radius.zero);
        break;

      case ColorTilePosition.right:
        r = const BorderRadius.only(
          bottomRight: Radius.circular(25),
          topRight: Radius.circular(25),
        );
        break;
    }
    return r;
  }

  /// The Gradient of this Tile.
  Gradient get _gradient {
    final Gradient gradient;

    switch (widget.position) {
      case ColorTilePosition.left:
        gradient = LinearGradient(
          colors: [
            widget.color,
            Color.lerp(widget.color, widget.colorRight, .5)!
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: const [.7, 1.0],
          tileMode: TileMode.clamp,
        );
        break;

      case ColorTilePosition.middle:
        gradient = LinearGradient(
          colors: [
            Color.lerp(widget.colorLeft, widget.color, .5)!,
            widget.color,
            Color.lerp(widget.color, widget.colorRight, .5)!,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: const [.0, .5, 1.0],
          tileMode: TileMode.clamp,
        );
        break;

      case ColorTilePosition.right:
        gradient = LinearGradient(
          colors: [
            Color.lerp(widget.colorLeft, widget.color, .5)!,
            widget.color,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: const [.0, .3],
          tileMode: TileMode.clamp,
        );
        break;

      default:
        throw Exception('Unexpected enum Value');
    }
    return gradient;
  }

  /// The function called when
  /// the Color Tile recognized an onTap event.
  void _onTap() {
    if (widget.color == Theme.of(context).scaffoldBackgroundColor) {
      return;
    } else {
      widget.onTap(widget.color);
    }
  }
}
