import 'package:flutter/material.dart';
import 'package:porra_dam/data/equipo_data.dart';

class TarjetaJornada extends StatefulWidget {
  final Equipo local;
  final Equipo visitante;
  const TarjetaJornada({super.key, required this.local, required this.visitante});

  @override
  State<TarjetaJornada> createState() => _TarjetaJornadaState();
}

class _TarjetaJornadaState extends State<TarjetaJornada> {

  int _golesLocal = 0;
  int _golesVisitante = 0;

  void _cambiar({int? local, int? visitante}) {
    setState(() {
      _golesLocal = local ?? _golesLocal;
      _golesVisitante = visitante ?? _golesVisitante;
    });
  }

  @override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(child: TarjetaPartido(equipo: widget.local)),
            ContadorGoles(
              goles: _golesLocal,
              onChanged: (g) => _cambiar(local: g),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: TarjetaPartido(equipo: widget.visitante)),
            ContadorGoles(
              goles: _golesVisitante,
              onChanged: (g) => _cambiar(visitante: g),
            ),
          ],
        ),
      ],
    ),
  );
}
}

class ContadorGoles extends StatelessWidget {
  final int goles;
  final ValueChanged<int> onChanged;

  const ContadorGoles({super.key, required this.goles, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final borde = Border.all(color: Colors.grey.shade300);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: goles > 0 ? () => onChanged(goles - 1) : null,
          child: Container(
            width: 64,
            padding: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              border: borde,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$goles',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(width: 6),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 18,
                  color: goles > 0 ? Colors.grey.shade700 : Colors.grey.shade400,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        InkWell(
          customBorder: const CircleBorder(),
          onTap: () => onChanged(goles + 1),
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(shape: BoxShape.circle, border: borde),
            child: Icon(Icons.keyboard_arrow_up, size: 18, color: Colors.grey.shade700),
          ),
        ),
      ],
    );
  }
}

class TarjetaPartido extends StatelessWidget {
  final Equipo equipo;
  const TarjetaPartido({super.key, required this.equipo});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 28,
          height: 28,
          child: Image.asset(equipo.imagen, fit: BoxFit.contain),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            equipo.nombre,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}