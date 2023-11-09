import 'dart:math' as math;

import 'package:vector_math/vector_math_64.dart';

Vector2 project(Vector3 point, double rotation, double aspectRatio) {
  final viewMatrix = makeViewMatrix(
    Vector3(
          0.25,
          math.cos(rotation),
          math.sin(rotation),
        ) *
        2,
    Vector3.all(0.5),
    Vector3(1, 0, 0),
  );

  const near = 1.0;
  const fov = 60.0;
  const zoom = 1.0;
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

  final transformationMatrix = projectionMatrix * viewMatrix;

  final projectiveCoords = Vector4(point.x, point.y, point.z, 1.0);
  projectiveCoords.applyMatrix4(transformationMatrix);

  var x = projectiveCoords.x / projectiveCoords.w;
  var y = projectiveCoords.y / projectiveCoords.w;

  return Vector2(x, y);
}
