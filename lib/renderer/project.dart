import 'dart:math' as math;
import 'package:vector_math/vector_math_64.dart';

Vector2 project(Vector3 point, double rotation) {
  final viewMatrix = makeViewMatrix(
    Vector3(
          0,
          math.cos(rotation),
          math.sin(rotation),
        ) *
        2,
    Vector3.all(0.5),
    Vector3(1, 0, 0),
  );

  const near = 1.0;
  const fov = 120.0;
  const zoom = 1.0;
  const aspectRatio = 1.0;
  final double top = near * math.tan(radians(fov) / 2.0) / zoom;
  final double bottom = -top;
  final double right = top * aspectRatio;
  final double left = -right;
  const double far = 1000.0;

  final projectionMatrix = makeFrustumMatrix(
    left,
    right,
    bottom,
    top,
    near,
    far,
  );

  final perspectiveMatrix = makePerspectiveMatrix(
    radians(fov),
    aspectRatio,
    near,
    far,
  );

  final transformationMatrix = perspectiveMatrix * viewMatrix;
  final newPoint = point.clone();
  newPoint.applyMatrix4(transformationMatrix);

  var x = newPoint.x;
  var y = newPoint.y;

  return Vector2(x, y);
}
