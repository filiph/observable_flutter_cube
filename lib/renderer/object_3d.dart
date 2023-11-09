import 'package:vector_math/vector_math_64.dart';

class Object3D {
  final Vector3 position = Vector3(0.0, 0.0, 0.0);

  final List<Vector3> points;

  Object3D({required this.points});
}
