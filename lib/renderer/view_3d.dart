import 'package:flutter/material.dart';
import 'package:observable_flutter_cube/renderer/object_3d.dart';
import 'package:observable_flutter_cube/renderer/project.dart';

class View3D extends StatelessWidget {
  final Object3D object;

  const View3D({
    required this.object,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _View3DPainter(object),
    );
  }
}

class _View3DPainter extends CustomPainter {
  final Object3D object;

  _View3DPainter(this.object);

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
    for (final (i, point) in object.points.indexed) {
      const pointSize = 5.0;
      var screenPoint = project(point, size);

      var color = _palette[i % _palette.length];
      _paint.color = color;

      canvas.drawCircle(
        Offset(screenPoint.x, screenPoint.y),
        pointSize,
        _paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
