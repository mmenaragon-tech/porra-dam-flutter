class Equipo {
  final String nombre;
  final String imagen;

  const Equipo({required this.nombre, required this.imagen});
}

final List<Equipo> equipos = [
  const Equipo(nombre: 'Atlético Madrid', imagen: 'assets/images/atm.webp'),
  const Equipo(nombre: 'Real Madrid', imagen: 'assets/images/rm.webp'),
  const Equipo(nombre: 'FC Barcelona', imagen: 'assets/images/blc.webp'),
  const Equipo(nombre: 'Villarreal CF', imagen: 'assets/images/villa.webp'),
  const Equipo(nombre: 'Sevilla FC', imagen: 'assets/images/sev.webp'),
  const Equipo(nombre: 'Real Sociedad', imagen: 'assets/images/rs.webp'),
  const Equipo(nombre: 'Betis', imagen: 'assets/images/betis.webp'),
  const Equipo(nombre: 'Valencia CF', imagen: 'assets/images/vlc.webp'),
  const Equipo(nombre: 'Athletic Club', imagen: 'assets/images/ath.webp'),
  const Equipo(nombre: 'Celta de Vigo', imagen: 'assets/images/celta.webp'),
];