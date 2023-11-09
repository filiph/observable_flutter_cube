import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:observable_flutter_cube/renderer/object_3d.dart';
import 'package:observable_flutter_cube/renderer/project.dart';

class View3D extends StatefulWidget {
  final Object3D object;

  const View3D({
    required this.object,
    super.key,
  });

  @override
  State<View3D> createState() => _View3DState();
}

class _View3DState extends State<View3D> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    _controller.repeat();
  }

  void _stopStartAnimation() {
    if (_controller.isAnimating) {
      _controller.stop();
    } else {
      _controller.repeat();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _stopStartAnimation,
      child: CustomPaint(
        painter: _View3DPainter(
          widget.object,
          animation: _controller,
        ),
      ),
    );
  }
}

class _View3DPainter extends CustomPainter {
  final Object3D object;
  final Animation<double> animation;

  _View3DPainter(this.object, {required this.animation})
      : super(repaint: animation);

  final _paint = Paint()..color = Colors.red;

  static const _palette = [
    // Color(0xFF4f186b),
    // Color(0xFF3e4db4),
    // Color(0xFF91144e),
    Color(0xFFea1f25),
    // Color(0xFFad6d37),
    Color(0xFFf1ca00),
    Color(0xFFecddbe),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    var aspectRatio = size.width / size.height;

    for (final (i, point) in object.points.indexed) {
      const pointSize = 5.0;
      var screenPoint =
          project(point, animation.value * math.pi * 2, aspectRatio);

      var color = _palette[i % _palette.length];
      _paint.color = color;

      // Remaps coordinates from [-1, 1] to the [0, viewport].
      var x = (1.0 + screenPoint.x) * size.width / 2;
      var y = (1.0 - screenPoint.y) * size.height / 2;

      canvas.drawCircle(Offset(x, y), pointSize, _paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
