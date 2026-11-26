import 'package:flutter/material.dart';
import 'package:porra_dam/features/jornada/tarjeta_jornada.dart';
import 'package:porra_dam/data/jornada.dart';
import 'package:porra_dam/data/cargar_datos.dart';

class PantallaJornada extends StatefulWidget {
  const PantallaJornada({super.key});

  @override
  State<PantallaJornada> createState() => _PantallaJornadaState();
}

class _PantallaJornadaState extends State<PantallaJornada> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: datosCargados,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text(
              'Error al cargar los datos',
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        final jornada = jornadas.first;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CabeceraBienvenida(jornada: jornada),
            Expanded(
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Column(
                  children: [
                    Expanded(child: PartidosJornada(jornada: jornada)),
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
      },
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
  final Jornada jornada;
  const CabeceraBienvenida({super.key, required this.jornada});

  static const _dias = ['Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb', 'Dom'];
  static const _meses = [
    'ene', 'feb', 'mar', 'abr', 'may', 'jun',
    'jul', 'ago', 'sep', 'oct', 'nov', 'dic',
  ];

  String _formatear(DateTime f) {
    final hora = f.hour.toString().padLeft(2, '0');
    final min = f.minute.toString().padLeft(2, '0');
    return '${_dias[f.weekday - 1]} ${f.day} ${_meses[f.month - 1]} - $hora:$min';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Jornada ${jornada.numero}',
            style: const TextStyle(
                color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 2),
          const Text(
            'Tu porra para esta jornada',
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.calendar_month, color: Colors.white, size: 14),
              const SizedBox(width: 6),
              Text(
                'Se cierra el: ${_formatear(jornada.cierre)}',
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PartidosJornada extends StatelessWidget {
  final Jornada jornada;
  const PartidosJornada({super.key, required this.jornada});

  @override
  Widget build(BuildContext context) {
    final partidos = jornada.partidos;

    return ListView.separated(
      padding: const EdgeInsets.only(top: 8),
      itemCount: partidos.length,
      separatorBuilder: (_, __) =>
          const Divider(height: 1, indent: 16, endIndent: 16),
      itemBuilder: (context, index) =>
          TarjetaJornada(partido: partidos[index]),
    );
  }
}

