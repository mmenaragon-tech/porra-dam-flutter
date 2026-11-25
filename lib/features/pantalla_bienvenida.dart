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

class FormularioAcceso extends StatefulWidget {
  const FormularioAcceso({super.key});

  @override
  State<FormularioAcceso> createState() => _FormularioAccesoState();
}

class _FormularioAccesoState extends State<FormularioAcceso> {
  final _formKey = GlobalKey<FormState>();
  final _aliasCtrl = TextEditingController();
  final _grupoCtrl = TextEditingController();

  @override
  void dispose() {
    _aliasCtrl.dispose();
    _grupoCtrl.dispose();
    super.dispose();
  }

  String? _validarAlias(String? valor) {
    final alias = valor?.trim() ?? '';
    if (alias.isEmpty) return 'Escribe un alias';
    if (alias.length < 3) return 'Mínimo 3 caracteres';
    if (alias.length > 15) return 'Máximo 15 caracteres';
    return null;
  }

  String? _validarGrupo(String? valor) {
    final sala = valor?.trim().replaceAll(' ', '').toLowerCase() ?? '';
    if (sala.isEmpty) return 'Escribe el nombre del grupo';
    if (sala.length < 10) return 'La sala introducida no es válida';
    final grupo = sala.substring(0, 2);
    final gruposValidos = ['1a', '1b', '2a'];
    if (!gruposValidos.contains(grupo)) return 'La sala introducida no es válida';
    final anio = sala.substring(sala.length - 4);
    final anioNum = int.tryParse(anio);
    if (anioNum == null || anioNum > 2026) {
      return 'La sala introducida no es válida';
    }
    return null;
  }

  void _entrar() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const PantallaPrincipal()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CampoTexto(
                etiqueta: "TU ALIAS",
                hint: "Escribe tu nombre o alias",
                icono: Icons.person_outline,
                controller: _aliasCtrl,
                validator: _validarAlias,
                accion: TextInputAction.next,
              ),
              const SizedBox(height: 15),
              CampoTexto(
                etiqueta: "CÓDIGO DEL GRUPO",
                hint: "p. ej. 1A - DAM - 2026",
                icono: Icons.groups_outlined,
                controller: _grupoCtrl,
                validator: _validarGrupo,
                accion: TextInputAction.done,
              ),
              const SizedBox(height: 20),
              BotonEntrar(onPressed: _entrar),
            ],
          ),
        ),
      ),
    );
  }
}

class CampoTexto extends StatelessWidget {
  final String etiqueta;
  final String hint;
  final IconData icono;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputAction? accion;
  final ValueChanged<String>? onSubmitted;

  const CampoTexto({
    super.key,
    required this.etiqueta,
    required this.hint,
    required this.icono,
    required this.controller,
    this.validator,
    this.accion,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder borde(Color? color) => OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: color == null
              ? BorderSide.none
              : BorderSide(color: color, width: 1.5),
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
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
        TextFormField(
          controller: controller,
          validator: validator,
          textInputAction: accion,
          onFieldSubmitted: onSubmitted,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.black38),
            prefixIcon: Icon(icono, color: Colors.black45),
            filled: true,
            fillColor: const Color(0xFFF1F5F9),
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            border: borde(null),
            enabledBorder: borde(null),
            focusedBorder: borde(Colors.black54),
            errorBorder: borde(Colors.red.shade400),
            focusedErrorBorder: borde(Colors.red.shade400),
          ),
        ),
      ],
    );
  }
}

class BotonEntrar extends StatelessWidget {
  final VoidCallback onPressed;
  const BotonEntrar({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        child: const Text("Entrar en la porra ->"),
      ),
    );
  }
}