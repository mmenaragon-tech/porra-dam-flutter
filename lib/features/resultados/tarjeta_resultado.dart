import 'package:flutter/material.dart';
import 'package:porra_dam/data/resultado_data.dart';
import 'package:porra_dam/data/partidos_data.dart';
import 'package:porra_dam/data/equipo_data.dart';

class TarjetaEquipo extends StatelessWidget {
  final Equipo equipo;
  const TarjetaEquipo({super.key, required this.equipo});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 28,
          height: 28,
          child: Image.asset(equipo.imagen, fit: BoxFit.contain),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            equipo.nombre,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}

class TarjetaPartido extends StatelessWidget {
  final Partido partido;
  const TarjetaPartido({super.key, required this.partido});

  Widget _fila(Equipo equipo, int goles) {
    return Row(
      children: [
        Expanded(child: TarjetaEquipo(equipo: equipo)),
        Text(
          '$goles',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _fila(partido.local, partido.golesLocal),
        const SizedBox(height: 8),
        _fila(partido.visitante, partido.golesVisitante),
      ],
    );
  }
}

class TarjetaResultado extends StatelessWidget {
  final Resultado resultado;
  const TarjetaResultado({super.key, required this.resultado});

  @override
  Widget build(BuildContext context) {
    final puntos = resultado.puntos;
    final porra = resultado.porra;

    final Color fondo;
    final Color texto;
    if (puntos == 0) {
      fondo = Colors.red.shade50;
      texto = Colors.red.shade600;
    } else if (puntos >= 8) {
      fondo = Colors.green.shade100;
      texto = Colors.green.shade700;
    } else {
      fondo = Colors.grey.shade200;
      texto = Colors.black54;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TarjetaPartido(partido: resultado.partido),
                const SizedBox(height: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: fondo,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Tu porra: ${porra.golesLocal} - ${porra.golesVisitante}',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: texto,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 56,
            height: 56,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: fondo,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              puntos > 0 ? '+$puntos' : '$puntos',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: texto,
              ),
            ),
          ),
        ],
      ),
    );
  }
}