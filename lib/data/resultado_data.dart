import 'partidos_data.dart';
import 'porra_data.dart';
import 'usuario_data.dart';

class Resultado {
  final Partido partido;
  final Usuario usuario;

  const Resultado({required this.partido, required this.usuario});

  // La porra del usuario para este partido (null si no apostó)
  Porra? get porra {
    for (final p in usuario.porras) {
      if (p.local.nombre == partido.local.nombre &&
          p.visitante.nombre == partido.visitante.nombre) {
        return p;
      }
    }
    return null;
  }

  int get puntos {
    final porra = this.porra;
    if (porra == null) return 0;

    final gl = partido.golesLocal;
    final gv = partido.golesVisitante;
    final pl = porra.golesLocal;
    final pv = porra.golesVisitante;

    if (gl == pl && gv == pv) return 8;

    int total = 0;
    if ((gl - gv).sign == (pl - pv).sign) total += 4;
    if (gl == pl) total += 2;
    return total;
  }
}

final List<Resultado> resultados = [
  for (final p in partidos) Resultado(partido: p, usuario: usuarioActual),
];