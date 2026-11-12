import 'package:flutter/material.dart';
import 'package:porra_dam/features/clasificacion/lista_clasificacion.dart';

class PantallaClasificacion extends StatefulWidget {
  const PantallaClasificacion({super.key});

  @override
  State<PantallaClasificacion> createState() => _PantallaClasificacionState();
}

class _PantallaClasificacionState extends State<PantallaClasificacion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        
        Expanded(
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Column(
              children: [
                const CabeceraPrincipal(),
                const Expanded(child: ListaClasificacion())
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CabeceraPrincipal extends StatelessWidget {
  const CabeceraPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Clasificacion',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color: Colors.grey
                  )
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'General',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.keyboard_arrow_down,
                        size: 18, color: Colors.black87),
                  ],
                ),
              ),
            ],
          ),
            Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Row(
              children: [
                SizedBox(
                  width: 52,
                  child: Text('#', style: estiloCabecera),
                ),
                Expanded(
                  child: Text('Participante', style: estiloCabecera),
                ),
                Text('Puntos', style: estiloCabecera),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final estiloCabecera = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
  color: Colors.grey.shade600,
);