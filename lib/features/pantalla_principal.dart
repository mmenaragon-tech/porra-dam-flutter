import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:porra_dam/utils/fondo_pantalla.dart';
import 'package:porra_dam/data/usuario.dart';
import 'package:porra_dam/data/cargar_datos.dart';

class PantallaPrincipal extends StatelessWidget {
  final Widget child;
  const PantallaPrincipal({super.key, required this.child});

  static const _rutas = ['/jornada', '/resultados', '/clasificacion'];

  @override
  Widget build(BuildContext context) {
    final ruta = GoRouterState.of(context).matchedLocation;
    final indice = _rutas.indexOf(ruta).clamp(0, _rutas.length - 1);

    return Stack(
      fit: StackFit.expand,
      children: [
        const FondoPantalla(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Center(
              child: Text(
                "Porra DAM",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => context.go('/'),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Center(
                  child: FutureBuilder<void>(
                    future: datosCargados,
                    builder: (context, snapshot) =>
                        snapshot.connectionState == ConnectionState.done
                            ? CajaPuntos(puntos: usuarioActual.puntos)
                            : const SizedBox.shrink(),
                  ),
                ),
              ),
            ],
          ),
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            elevation: 0,
            currentIndex: indice,
            onTap: (i) => context.go(_rutas[i]),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.star), label: "Jornada"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.workspace_premium), label: "Resultados"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.leaderboard), label: "Clasificación"),
            ],
          ),
        ),
      ],
    );
  }
}

class CajaPuntos extends StatelessWidget {
  final int puntos;
  const CajaPuntos({super.key, required this.puntos});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFA5D6A7)),
      ),
      child: Text(
        '$puntos pts',
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Color(0xFF2E7D32),
        ),
      ),
    );
  }
}