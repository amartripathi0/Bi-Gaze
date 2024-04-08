import 'package:flutter/material.dart';

import 'package:glass_kit/glass_kit.dart';

class PurpleGlassCard extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final double blur;
  final double borderWidth;
  final double elevation;
  final bool isFrostedGlass;
  final Color shadowColor;
  final Alignment alignment;
  final double frostedOpacity;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final ShapeBorder shape;

  const PurpleGlassCard({
    super.key,
    required this.child,
    this.height = 500,
    this.width = 450,
    this.blur = 15.0,
    this.borderWidth = 1.5,
    this.elevation = 3.0,
    this.isFrostedGlass = false,
    this.shadowColor = Colors.black,
    this.alignment = Alignment.center,
    this.frostedOpacity = 0.12,
    this.margin = const EdgeInsets.all(8.0),
    this.padding = const EdgeInsets.all(8.0),
    this.shape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: height,
      width: width,
      gradient: LinearGradient(
        colors: [
          const Color.fromARGB(255, 23, 22, 22).withOpacity(0.40),
          const Color.fromARGB(255, 100, 65, 116).withOpacity(0.10)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderGradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.60),
          Colors.white.withOpacity(0.10),
          const Color.fromARGB(255, 157, 106, 188).withOpacity(0.05),
          const Color.fromARGB(255, 144, 95, 165).withOpacity(0.6)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: const [0.0, 0.39, 0.40, 1.0],
      ),
      blur: blur,
      borderWidth: borderWidth,
      elevation: elevation,
      isFrostedGlass: isFrostedGlass,
      shadowColor: shadowColor,
      alignment: alignment,
      frostedOpacity: frostedOpacity,
      margin: margin,
      padding: padding,
      shape: BoxShape.rectangle,
      child: child,
    );
  }
}
