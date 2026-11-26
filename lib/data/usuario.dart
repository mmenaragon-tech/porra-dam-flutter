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

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
    id: json['id'],
    nombre: json['nombre'],
    puntosAcumulados: json['puntosAcumulados'] ?? 0,
    porras: [for (final p in json['porras']) Porra.fromJson(p)],
  );
  
}

List<Usuario> usuarios = [];

Usuario get usuarioActual => usuarios.firstWhere((u) => u.id == 0);


