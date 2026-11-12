import 'package:flutter/material.dart';
import 'package:porra_dam/features/clasificacion/clasificacion_screen.dart';
import 'package:porra_dam/features/jornada/jornada_screen.dart';
import 'package:porra_dam/features/resultados/resultados_screen.dart';
import 'package:porra_dam/utils/fondo_pantalla.dart';

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
            title: Text("Porra DAM"),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            elevation: 0,
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