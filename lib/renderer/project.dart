import 'package:vector_math/vector_math_64.dart';

Vector2 project(Vector3 point) {
  var x = point.x;
  var y = point.y;

  return Vector2(x, y);
}
