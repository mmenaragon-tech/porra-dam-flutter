import 'equipo_data.dart';

class Partido {
  final Equipo local;
  final Equipo visitante;
  final int golesLocal;
  final int golesVisitante;

  const Partido({required this.local, required this.visitante, required this.golesLocal, required this.golesVisitante});
}


final List<Partido> partidos = [
  Partido(
    local: buscarEquipo('Atlético Madrid'),
    visitante: buscarEquipo('Real Madrid'),
    golesLocal: 2,
    golesVisitante: 1,
  ),
  Partido(
    local: buscarEquipo('FC Barcelona'),
    visitante: buscarEquipo('Villarreal CF'),
    golesLocal: 3,
    golesVisitante: 0,
  ),
  Partido(
    local: buscarEquipo('Sevilla FC'),
    visitante: buscarEquipo('Real Sociedad'),
    golesLocal: 1,
    golesVisitante: 1,
  ),
  Partido(
    local: buscarEquipo('Betis'),
    visitante: buscarEquipo('Valencia CF'),
    golesLocal: 2,
    golesVisitante: 1,
  ),
  Partido(
    local: buscarEquipo('Athletic Club'),
    visitante: buscarEquipo('Celta de Vigo'),
    golesLocal: 1,
    golesVisitante: 0,
  ),
];