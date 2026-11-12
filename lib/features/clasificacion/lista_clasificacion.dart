import 'package:flutter/material.dart';
import 'package:porra_dam/data/usuario_data.dart';

class ListaClasificacion extends StatelessWidget {
  const ListaClasificacion({super.key});

  @override
  Widget build(BuildContext context) {
    final lista = clasificacion; // se ordena una sola vez por build

    return ListView.builder(
      itemCount: lista.length,
      itemBuilder: (context, index) {
        final usuario = lista[index];
        return FilaClasificacion(
          posicion: index + 1,
          usuario: usuario,
          esActual: usuario == usuarioActual,
        );
      },
    );
  }
}

class FilaClasificacion extends StatelessWidget {
  final int posicion;
  final Usuario usuario;
  final bool esActual;

  const FilaClasificacion({
    super.key,
    required this.posicion,
    required this.usuario,
    required this.esActual,
  });

  @override
  Widget build(BuildContext context) {
    final nombre = esActual ? 'Tú · ${usuario.nombre}' : usuario.nombre;

    return Container(
      color: esActual ? const Color(0xFFE8F5E9) : null,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          SizedBox(
            width: 32,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Posicion(posicion: posicion),
            ),
          ),
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.grey.shade300,
            child: Text(
              usuario.nombre[0].toUpperCase(),
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              nombre,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            '${usuario.puntos}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class Posicion extends StatelessWidget {
  final int posicion;
  const Posicion({super.key, required this.posicion});

  static const _medallas = [
    // oro, plata, bronce: fondo, borde, texto
    (Color(0xFFFFF3C4), Color(0xFFE0A800), Color(0xFFB38600)),
    (Color(0xFFEDEDED), Color(0xFF9E9E9E), Color(0xFF616161)),
    (Color(0xFFF8E0CC), Color(0xFFCD7F32), Color(0xFF8D5524)),
  ];

  @override
  Widget build(BuildContext context) {
    if (posicion > 3) {
      return Text(
        '$posicion',
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Color(0xFF757575),
        ),
      );
    }

    final (fondo, borde, texto) = _medallas[posicion - 1];

    return Container(
      width: 26,
      height: 26,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: fondo,
        shape: BoxShape.circle,
        border: Border.all(color: borde, width: 1.5),
      ),
      child: Text(
        '$posicion',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: texto,
        ),
      ),
    );
  }
}