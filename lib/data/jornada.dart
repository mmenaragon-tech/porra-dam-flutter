import 'partido.dart';

class Jornada {
  final List<Partido> partidos;
  final String numero;

  const Jornada({required this.partidos, required this.numero});

  factory Jornada.fromJson(Map<String, dynamic> json) => Jornada(
    numero: json['numero'].toString(),
    partidos: [for (final p in json['partidos']) Partido.fromJson(p)],
  );

}

List<Jornada> jornadas = [];

