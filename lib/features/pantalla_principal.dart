import 'package:flutter/material.dart';
import 'package:porra_dam/features/clasificacion/clasificacion_screen.dart';
import 'package:porra_dam/features/jornada/jornada_screen.dart';
import 'package:porra_dam/features/resultados/resultados_screen.dart';
import 'package:porra_dam/utils/fondo_pantalla.dart';
import 'package:porra_dam/data/usuario_data.dart';

class PantallaPrincipal extends StatefulWidget {
  const new({super.key});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {

  int _indiceSeleccionado = 0;

  final List<Widget>_pantallas = [PantallaJornada(), PantallaResultados(), PantallaClasificacion()];

  void _cambiar(int index) {
    setState(() {
      _indiceSeleccionado = index;
    });
  }
  

  
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const FondoPantalla(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Center(child: 
              Text(
                "Porra DAM", 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Center(child: CajaPuntos(puntos: usuarioActual.puntos)),
              ),
            ],
          ),
          body: _pantallas[_indiceSeleccionado],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            elevation: 0,
            currentIndex: _indiceSeleccionado,
            onTap: _cambiar,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: "Jornada",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.workspace_premium),
                label: "Resultados",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.leaderboard),
                label: "Clasificación",
              )
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