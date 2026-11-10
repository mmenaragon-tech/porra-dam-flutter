import 'package:flutter/material.dart';
import '/features/pantalla_bienvenida.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return ColoredBox(
          color: Colors.grey.shade300, // color de los laterales
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: child,
            ),
          ),
        );
      },
      home: const PantallaBienvenida(),
    );
  }
}

