import 'package:porra_dam/data/porra_data.dart';
import 'package:porra_dam/data/equipo_data.dart';
import 'package:porra_dam/data/partidos_data.dart';

class Usuario {
  final String nombre;
  final List<Porra> porras;
  final int puntosAcumulados;

  const Usuario({required this.nombre, required this.porras, this.puntosAcumulados = 0});

  int get puntos {
    int total = puntosAcumulados;
    for (final porra in porras) {
      for (final partido in partidos) {
        if (porra.local.nombre == partido.local.nombre &&
            porra.visitante.nombre == partido.visitante.nombre) {
          total += porra.puntosContra(partido);
          break;
        }
      }
    }
    return total;
  }
}

final Usuario usuarioActual = Usuario(
  nombre: 'mcoma', 
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
  ],
  puntosAcumulados: 16
);

final List<Usuario> usuarios = [
  const Usuario(nombre: 'LUCÍA R.', porras: [], puntosAcumulados: 45),
  const Usuario(nombre: 'PabloDev', porras: [], puntosAcumulados: 41),
  const Usuario(nombre: 'Nerea_K', porras: [], puntosAcumulados: 40),
  usuarioActual,
  const Usuario(nombre: 'Hugo M.', porras: [], puntosAcumulados: 35),
  const Usuario(nombre: 'Aitana', porras: [], puntosAcumulados: 33),
  const Usuario(nombre: 'xavier.dev', porras: [], puntosAcumulados: 30),
  const Usuario(nombre: 'Iván G.', porras: [], puntosAcumulados: 27),
  const Usuario(nombre: 'Sara P.', porras: [], puntosAcumulados: 26),
  const Usuario(nombre: 'Dani_804', porras: [], puntosAcumulados: 19),
];

List<Usuario> get clasificacion =>
    [...usuarios]..sort((a, b) => b.puntos.compareTo(a.puntos));

