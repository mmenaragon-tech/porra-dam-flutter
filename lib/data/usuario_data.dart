import 'package:porra_dam/data/porra_data.dart';
import 'package:porra_dam/data/equipo_data.dart';

class Usuario {
  final String nombre;
  final List<Porra> porras;

  const Usuario({required this.nombre, required this.porras});
}

final Usuario usuarioActual = Usuario(
  nombre: 'Pepe', 
  porras: [
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
  ]
);

