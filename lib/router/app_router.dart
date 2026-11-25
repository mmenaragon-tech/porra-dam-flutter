import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:porra_dam/features/bienvenida/alias_provider.dart';
import 'package:porra_dam/features/clasificacion/clasificacion_screen.dart';
import 'package:porra_dam/features/jornada/jornada_screen.dart';
import 'package:porra_dam/features/bienvenida/pantalla_bienvenida.dart';
import 'package:porra_dam/features/pantalla_principal.dart';
import 'package:porra_dam/features/resultados/resultados_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final tieneAlias = ref.read(aliasProvider).isNotEmpty;
      if (!tieneAlias && state.matchedLocation != '/') return '/';
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const PantallaBienvenida(),
      ),
      ShellRoute(
        builder: (context, state, child) => PantallaPrincipal(child: child),
        routes: [
          GoRoute(
            path: '/jornada',
            builder: (context, state) => const PantallaJornada(),
          ),
          GoRoute(
            path: '/resultados',
            builder: (context, state) => const PantallaResultados(),
          ),
          GoRoute(
            path: '/clasificacion',
            builder: (context, state) => const PantallaClasificacion(),
          ),
        ],
      ),
    ],
  );
});