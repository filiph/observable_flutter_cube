import 'package:flutter/material.dart';
import 'package:observable_flutter_cube/renderer/object_3d.dart';
import 'package:observable_flutter_cube/renderer/view_3d.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 3D Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFea1f25),
          brightness: Brightness.dark,
        ),
      ),
      home: const MyHomePage(title: 'Enjoy this 3D view'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1a1616),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(64.0),
          child: SizedBox.expand(
            child: View3D(
              object: cube,
            ),
          ),
        ),
      ),
    );
  }
}

final cube = Object3D(
  points: [
    Vector3(0, 0, 0),
    Vector3(0, 0, 1),
    Vector3(0, 1, 0),
    Vector3(0, 1, 1),
    Vector3(1, 0.4, 0.4),
    Vector3(1, 0.6, 0.4),
    Vector3(1, 0.4, 0.6),
    Vector3(1, 0.6, 0.6),
    // Vector3(1, 0, 1),
    // Vector3(1, 1, 0),
    // Vector3(1, 1, 1),
    // Vector3(1, 0, 0),
    // Vector3(1, 1, 0),
    // Vector3(1, 0, 1),
    // Vector3(1, 1, 1),
  ],
);
