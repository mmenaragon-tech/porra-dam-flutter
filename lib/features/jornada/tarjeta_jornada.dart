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
      if (_golesLocal >= 10) {
        _golesLocal = _golesLocal - 1;
      }
      if (_golesVisitante >= 10) {
        _golesVisitante = _golesVisitante - 1;
      }
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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: SizedBox(
            width: 64,
            height: 32,
            child: IconButton(
              onPressed: goles > 0 ? () => onChanged(goles - 1) : null,
              padding: EdgeInsets.zero,
              style: IconButton.styleFrom(
                minimumSize: Size.zero,
                fixedSize: const Size(64, 32),
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$goles',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      )),
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
        ),
        const SizedBox(width: 8),
        Center(
          child: SizedBox(
            width: 32,
            height: 32,
            child: IconButton(
              onPressed: goles < 9 ? () => onChanged(goles + 1) : null,
              icon: Icon(Icons.keyboard_arrow_up, size: 18, color: goles > 8 ? Colors.grey.shade400 : Colors.grey.shade700),
              padding: EdgeInsets.zero,
              style: IconButton.styleFrom(
                minimumSize: Size.zero,
                fixedSize: const Size(32, 32),
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
          ),
        )
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