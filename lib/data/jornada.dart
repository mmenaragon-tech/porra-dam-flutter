import 'partido.dart';

class Jornada {
  final List<Partido> partidos;
  final String numero;

  const Jornada({required this.partidos, required this.numero});

}

final List<Jornada> jornadas = [
  Jornada(
    numero: '1',
    partidos: [
      partidos[0],
      partidos[1],
      partidos[2],
      partidos[3],
      partidos[4],
    ],
  ),
];