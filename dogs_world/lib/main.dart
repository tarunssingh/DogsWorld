import 'package:dogs_world/dogs_world.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DogsWorld());
}

class DogsWorld extends StatelessWidget {
  const DogsWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'DogsWorld', home: DogsW());
  }
}
