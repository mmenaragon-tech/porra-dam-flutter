import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:porra_dam/data/jornada.dart';
import 'package:porra_dam/data/partido.dart';
import 'package:porra_dam/data/usuario.dart';

Future<void> cargarDatos() async {
  final jornadasJson =
      jsonDecode(await rootBundle.loadString('assets/data/jornadas.json'));
  jornadas = [for (final j in jornadasJson['jornadas']) Jornada.fromJson(j)];
  partidos = [for (final j in jornadas) ...j.partidos];

  final usuariosJson =
    jsonDecode(await rootBundle.loadString('assets/data/usuarios.json'));
  usuarios = [for (final u in usuariosJson['usuarios']) Usuario.fromJson(u)];

  
}

final Future<void> datosCargados = cargarDatos();