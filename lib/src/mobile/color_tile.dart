library color_chooser;

import 'package:flutter/material.dart';

/// Container to represent a single [color]
@protected
class ColorTile extends StatelessWidget {
  const ColorTile({
    required this.color,
    Key? key,
  }) : super(key: key);

  /// The Color this Tile
  /// should represents.
  final Color color;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        backgroundBlendMode: BlendMode.src,
        color: color,
      ),
      position: DecorationPosition.background,
      child: ListBody(
        reverse: true,
        mainAxis: Axis.vertical,
        children: [
          Text(color.toString()),
        ],
      ),
    );
  }
}
