import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porra_dam/data/usuario.dart';

class Pronostico {
  final int golesLocal;
  final int golesVisitante;

  const Pronostico({this.golesLocal = 0, this.golesVisitante = 0});

  Pronostico copyWith({int? golesLocal, int? golesVisitante}) => Pronostico(
        golesLocal: golesLocal ?? this.golesLocal,
        golesVisitante: golesVisitante ?? this.golesVisitante,
      );
}

class PronosticosNotifier extends Notifier<Map<int, Pronostico>> {
  @override
  Map<int, Pronostico> build() => {
        // Parte de las porras que ya tiene el usuario en el JSON
        for (final porra in usuarioActual.porras)
          porra.partido.id: Pronostico(
            golesLocal: porra.golesLocal ?? 0,
            golesVisitante: porra.golesVisitante ?? 0,
          ),
      };

  void cambiar(int partidoId, {int? local, int? visitante}) {
    final actual = state[partidoId] ?? const Pronostico();
    state = {
      ...state,
      partidoId: actual.copyWith(golesLocal: local, golesVisitante: visitante),
    };
  }
}

final pronosticosProvider =
    NotifierProvider<PronosticosNotifier, Map<int, Pronostico>>(
  PronosticosNotifier.new,
);