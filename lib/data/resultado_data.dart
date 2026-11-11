import 'partidos_data.dart';
import 'porra_data.dart';

class Resultado {
  final Partido partido;
  final Porra porra;

  const Resultado({required this.partido, required this.porra});

  int get puntos {
    final gl = partido.golesLocal;
    final gv = partido.golesVisitante;
    final pl = porra.golesLocal;
    final pv = porra.golesVisitante;

    // Resultado exacto
    if (gl == pl && gv == pv) return 8;

    int total = 0;

    // Acierta el signo (1, X o 2)
    if ((gl - gv).sign == (pl - pv).sign) total += 4;

    // Acierta los goles del local
    if (gl == pl) total += 2;

    return total;
  }
}

final List<Resultado> resultados = [
  // Atlético 2-1 Real Madrid | porra 2-1 -> 8 pts
  Resultado(
    partido: partidos[0],
    porra: porras[0],
  ),
  // Barcelona 3-0 Villarreal | porra 2-0 -> 4 pts
  Resultado(
    partido: partidos[1],
    porra: porras[1],
  ),
  // Sevilla 1-1 Real Sociedad | porra 1-0 -> 2 pts
  Resultado(
    partido: partidos[2],
    porra: porras[2],
  ),
  // Betis 2-1 Valencia | porra 1-1 -> 0 pts
  Resultado(
    partido: partidos[3],
    porra: porras[3],
  ),
  // Athletic 1-0 Celta | porra 1-0 -> 8 pts
  Resultado(
    partido: partidos[4],
    porra: porras[4],
  ),
];

