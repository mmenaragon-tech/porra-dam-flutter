import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porra_dam/data/partido.dart';
import 'package:porra_dam/data/usuario.dart';
import 'package:porra_dam/features/jornada/pronosticos_provider.dart';

/// Puntos de un pronóstico contra el resultado real de un partido.
/// 0 si no hay pronóstico o el partido aún no se ha jugado.
int puntosDe(Pronostico? pronostico, Partido partido) {
  if (pronostico == null ||
      partido.golesLocal == null ||
      partido.golesVisitante == null) {
    return 0;
  }

  final gl = partido.golesLocal!;
  final gv = partido.golesVisitante!;

  if (gl == pronostico.golesLocal && gv == pronostico.golesVisitante) return 8;

  int total = 0;
  if ((gl - gv).sign == (pronostico.golesLocal - pronostico.golesVisitante).sign) {
    total += 4;
  }
  if (gl == pronostico.golesLocal) total += 2;
  return total;
}

final puntosTotalesProvider = Provider<int>((ref) {
  final pronosticos = ref.watch(pronosticosProvider);
  var total = usuarioActual.puntosAcumulados;
  for (final partido in partidos) {
    total += puntosDe(pronosticos[partido.id], partido);
  }
  return total;
});