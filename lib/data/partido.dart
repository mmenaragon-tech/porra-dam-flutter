import 'equipo.dart';

class Partido {
  final int id;
  final Equipo local;
  final Equipo visitante;
  final int? golesLocal;
  final int? golesVisitante;
  final String fecha;
  final String hora;

  const Partido({required this.id, required this.local, required this.visitante, required this.golesLocal, required this.golesVisitante, 
  required this.fecha, required this.hora});

  factory Partido.fromJson(Map<String, dynamic> json) => Partido(
    id: json['id'],
    local: buscarEquipo(json['local']),
    visitante: buscarEquipo(json['visitante']),
    golesLocal: json['golesLocal'],
    golesVisitante: json['golesVisitante'],
    fecha: json['fecha'],
    hora: json['hora'],
  );
}

List<Partido> partidos = [];

