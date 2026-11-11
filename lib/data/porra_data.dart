import 'equipo_data.dart';

class Porra {
  final Equipo local;
  final Equipo visitante;
  final int golesLocal;
  final int golesVisitante;

  const Porra({required this.local, required this.visitante, required this.golesLocal, required this.golesVisitante});
}

Equipo buscarEquipo(String nombre) {
  return equipos.firstWhere((e) => e.nombre == nombre);
}

final List<Porra> porras = [
  Porra(
    local: buscarEquipo('Atlético Madrid'),
    visitante: buscarEquipo('Real Madrid'),
    golesLocal: 2,
    golesVisitante: 1,
  ),
  Porra(
    local: buscarEquipo('FC Barcelona'),
    visitante: buscarEquipo('Villarreal CF'),
    golesLocal: 2,
    golesVisitante: 0,
  ),
  Porra(
    local: buscarEquipo('Sevilla FC'),
    visitante: buscarEquipo('Real Sociedad'),
    golesLocal: 1,
    golesVisitante: 0,
  ),
  Porra(
    local: buscarEquipo('Betis'),
    visitante: buscarEquipo('Valencia CF'),
    golesLocal: 1,
    golesVisitante: 1,
  ),
  Porra(
    local: buscarEquipo('Athletic Club'),
    visitante: buscarEquipo('Celta de Vigo'),
    golesLocal: 1,
    golesVisitante: 0,
  ),
];