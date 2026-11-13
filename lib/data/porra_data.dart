import 'equipo_data.dart';
import 'partidos_data.dart';

class Porra {
  final Equipo local;
  final Equipo visitante;
  final int golesLocal;
  final int golesVisitante;

  const Porra({required this.local, required this.visitante, required this.golesLocal, required this.golesVisitante});

  int puntosContra(Partido partido) {
    final gl = partido.golesLocal;
    final gv = partido.golesVisitante;

    if (gl == golesLocal && gv == golesVisitante) return 8;

    int total = 0;
    if ((gl - gv).sign == (golesLocal - golesVisitante).sign) total += 4;
    if (gl == golesLocal) total += 2;
    return total;
  }
}

