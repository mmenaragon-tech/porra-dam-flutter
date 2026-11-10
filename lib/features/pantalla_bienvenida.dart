import 'package:flutter/material.dart';
import 'package:porra_dam/features/pantalla_principal.dart';
import 'package:porra_dam/utils/fondo_pantalla.dart';

class PantallaBienvenida extends StatelessWidget {
  const PantallaBienvenida({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const FondoPantalla(),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CabeceraBienvenida(),
                  SizedBox(height: 5),
                  FormularioAcceso(),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CabeceraBienvenida extends StatelessWidget {
  const CabeceraBienvenida({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                "Porra ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "DAM",
                style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Text(
            "Pronostica los partidos de cada jornada y compite con tu clase.",
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          const Text(
            "¿Quién acertará más?",
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class FormularioAcceso extends StatelessWidget {
  const FormularioAcceso({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            CampoTexto(
              etiqueta: "TU ALIAS",
              hint: "Escribe tu nombre o alias",
              icono: Icons.person_outline,
            ),
            SizedBox(height: 15),
            CampoTexto(
              etiqueta: "CÓDIGO DEL GRUPO",
              hint: "p. ej. 1A - DAM - 2026",
              icono: Icons.person_outline,
            ),
            SizedBox(height: 20),
            BotonEntrar(),
          ],
        ),
      ),
    );
  }
}

class CampoTexto extends StatelessWidget {
  final String etiqueta;
  final String hint;
  final IconData icono;

  const CampoTexto({
    super.key,
    required this.etiqueta,
    required this.hint,
    required this.icono,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
          child: Text(
            etiqueta,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              color: Colors.black54,
            ),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.black38),
            prefixIcon: Icon(icono, color: Colors.black45),
            filled: true,
            fillColor: const Color(0xFFF1F5F9),
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}

class BotonEntrar extends StatelessWidget {
  const BotonEntrar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const PantallaPrincipal()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        child: const Text("Entrar en la porra ->"),
      ),
    );
  }
}