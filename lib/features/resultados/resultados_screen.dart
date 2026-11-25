import 'package:flutter/material.dart';
import 'package:porra_dam/data/jornada.dart';
import 'package:porra_dam/data/usuario.dart';
import 'package:porra_dam/features/resultados/tarjeta_resultado.dart';

class PantallaResultados extends StatelessWidget {
  const PantallaResultados({super.key});

  @override
  Widget build(BuildContext context) {
    final Jornada jornada = jornadas[0];
    final Usuario usuario = usuarioActual;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        
        Expanded(
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              children: [
                const CabeceraPrincipal(),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    itemCount: jornada.partidos.length,
                    separatorBuilder: (_, __) =>
                        Divider(height: 1, color: Colors.grey.shade200),
                    itemBuilder: (_, i) =>
                        TarjetaResultado(partido: jornada.partidos[i], usuario: usuario,),
                  ),
                ),
                TotalJornada(puntos: calcularPuntosJornada(usuarioActual, jornada)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TotalJornada extends StatelessWidget {
  final int puntos;
  const TotalJornada({super.key, required this.puntos});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.amber.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.star, size: 18, color: Colors.amber.shade700),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'Total jornada',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '+$puntos pts',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CabeceraPrincipal extends StatelessWidget {
  const CabeceraPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Resultados',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color: Colors.grey
                  )
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Jornada 1',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.keyboard_arrow_down,
                        size: 18, color: Colors.black87),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          const Text(
            'Resultados oficiales y puntos obtenidos',
            style: TextStyle(color: Colors.black, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

int calcularPuntosJornada(Usuario usuario, Jornada jornada) {
  int total = 0;

  for (final partido in jornada.partidos) {
    for (final porra in usuario.porras) {
      if (porra.partido.id == partido.id) {
        total += porra.puntosContra(partido);
        break;
      }
    }
  }

  return total;
}