import 'dart:math';
import 'dart:ui';

import 'package:vector_math/vector_math_64.dart';

Vector2 project(Vector3 point, Size size) {
  var x = point.x;
  var y = point.y;

  var scale = min(size.width, size.height);

  var xProjected = x * scale;
  var yProjected = y * scale;
  return Vector2(xProjected, yProjected);
}
