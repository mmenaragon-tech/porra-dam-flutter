import 'partido.dart';

class Porra {
  final Partido partido;
  final int? golesLocal;
  final int? golesVisitante;

  const Porra({required this.partido, required this.golesLocal, required this.golesVisitante});
  

  int puntosContra(Partido? partido) {
    // Si no hay partido o todavía no hay resultado real,
    // no se pueden calcular los puntos.
    if (partido == null ||
        partido.golesLocal == null ||
        partido.golesVisitante == null ||
        golesLocal == null ||
        golesVisitante == null) {
      return 0;
    }

    final gl = partido.golesLocal!;
    final gv = partido.golesVisitante!;

    if (gl == golesLocal && gv == golesVisitante) return 8;

    int total = 0;

    // Acierta el signo del resultado (victoria, empate o derrota).
    if ((gl - gv).sign == (golesLocal! - golesVisitante!).sign) {
      total += 4;
    }

    // Acierta los goles del equipo local.
    if (gl == golesLocal) total += 2;

    return total;
  }

  
}

