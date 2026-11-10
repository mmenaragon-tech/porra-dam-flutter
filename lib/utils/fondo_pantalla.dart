import 'package:flutter/material.dart';

class FondoPantalla extends StatelessWidget {
  const FondoPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/fondo_pantalla_hd.webp",
      fit: BoxFit.cover,
      color: Colors.black.withValues(alpha: 0.4),
      colorBlendMode: BlendMode.darken,
    );
  }
}

