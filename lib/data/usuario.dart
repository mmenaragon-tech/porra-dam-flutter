import 'package:porra_dam/data/porra.dart';
import 'package:porra_dam/data/partido.dart';

class Usuario {
  final int id;
  final String nombre;
  final List<Porra> porras;
  final int puntosAcumulados;

  const Usuario({required this.id, required this.nombre, required this.porras, this.puntosAcumulados = 0});

  int get puntos {
    int total = puntosAcumulados;
    for (final porra in porras) {
      for (final partido in partidos) {
        if (porra.partido.local.nombre == partido.local.nombre &&
            porra.partido.visitante.nombre == partido.visitante.nombre) {
          total += porra.puntosContra(partido);
          break;
        }
      }
    }
    return total;
  }

  
}

final Usuario usuarioActual = Usuario(
  id: 0,
  nombre: 'mcoma',
  porras: [
    Porra(
      partido: partidos[0],
      golesLocal: 2,
      golesVisitante: 1,
    ),
    Porra(
      partido: partidos[1],
      golesLocal: 2,
      golesVisitante: 0,
    ),
    Porra(
      partido: partidos[2],
      golesLocal: 1,
      golesVisitante: 0,
    ),
    Porra(
      partido: partidos[3],
      golesLocal: 1,
      golesVisitante: 1,
    ),
    Porra(
      partido: partidos[4],
      golesLocal: 1,
      golesVisitante: 0,
    ),
  ],
  puntosAcumulados: 16,
);

final List<Usuario> usuarios = [
  const Usuario(id: 1, nombre: 'LUCÍA R.', porras: [], puntosAcumulados: 45),
  const Usuario(id: 2, nombre: 'PabloDev', porras: [], puntosAcumulados: 41),
  const Usuario(id: 3, nombre: 'Nerea_K', porras: [], puntosAcumulados: 40),
  usuarioActual,
  const Usuario(id: 5, nombre: 'Hugo M.', porras: [], puntosAcumulados: 35),
  const Usuario(id: 6, nombre: 'Aitana', porras: [], puntosAcumulados: 33),
  const Usuario(id: 7, nombre: 'xavier.dev', porras: [], puntosAcumulados: 30),
  const Usuario(id: 8, nombre: 'Iván G.', porras: [], puntosAcumulados: 27),
  const Usuario(id: 9, nombre: 'Sara P.', porras: [], puntosAcumulados: 26),
  const Usuario(id: 10, nombre: 'Dani_804', porras: [], puntosAcumulados: 19),
];

List<Usuario> get clasificacion =>
    [...usuarios]..sort((a, b) => b.puntos.compareTo(a.puntos));

