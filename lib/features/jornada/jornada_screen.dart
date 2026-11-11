import 'package:flutter/material.dart';
import 'package:porra_dam/data/equipo_data.dart';
import 'package:porra_dam/features/jornada/tarjeta_jornada.dart';

class PantallaJornada extends StatefulWidget {
  const PantallaJornada({super.key});

  @override
  State<PantallaJornada> createState() => _PantallaJornadaState();
}

class _PantallaJornadaState extends State<PantallaJornada> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const CabeceraBienvenida(),
        Expanded(
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              children: [
                const Expanded(child: PartidosJornada()),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size.fromHeight(52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Guardar pronósticos',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PuntosTotales extends StatelessWidget {
  const PuntosTotales({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        '0 pts',
        style: TextStyle(
          color: Colors.green.shade800,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class CabeceraBienvenida extends StatelessWidget {
  const CabeceraBienvenida({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Jornada 1',
            style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 2),
          Text(
            'Tu porra para esta jornada',
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.calendar_month, color: Colors.white, size: 14),
              SizedBox(width: 6),
              Text(
                'Se cierra el: Sáb 12 oct - 16:00',
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PartidosJornada extends StatelessWidget {
  const PartidosJornada({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 8),
      itemCount: equipos.length ~/ 2,
      separatorBuilder: (_, __) =>
          const Divider(height: 1, indent: 16, endIndent: 16),
      itemBuilder: (context, index) => TarjetaJornada(
        local: equipos[index * 2],
        visitante: equipos[index * 2 + 1],
      ),
    );
  }
}

