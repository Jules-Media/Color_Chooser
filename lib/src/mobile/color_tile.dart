library color_chooser;

import 'package:color_chooser/src/mobile/sub_color_chooser_screen_mobile.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:flutter/material.dart';

/// Container to represent a single [color]
@protected
class ColorTile extends StatefulWidget {
  const ColorTile({
    required this.color,
    Key? key,
  }) : super(key: key);

  /// The Color this Tile
  /// should represents.
  final Color color;

  @override
  State<StatefulWidget> createState() => _ColorTileState();
}

class _ColorTileState extends State<ColorTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      dragStartBehavior: DragStartBehavior.down,
      onTap: _openSubColorChooser,
      child: DecoratedBox(
        decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.src,
          color: widget.color,
        ),
        position: DecorationPosition.background,
        child: ListBody(
          reverse: true,
          mainAxis: Axis.vertical,
          children: [
            Text(widget.color.toString()),
          ],
        ),
      ),
    );
  }

  /// Opens the sub Color Chooser Screen and passes
  /// the color Argument.
  void _openSubColorChooser() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SubColorChooserScreenMobile(color: widget.color),
      ),
    );
  }
}
