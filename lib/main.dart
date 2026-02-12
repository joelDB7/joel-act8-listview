import 'package:flutter/material.dart';

void main() => runApp(const Apprelojpastillero());

class Apprelojpastillero extends StatelessWidget {
  const Apprelojpastillero({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "pastillero",
      home: Nombrepastilla(),
    );
  }
}

class Nombrepastilla extends StatelessWidget {
  const Nombrepastilla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'reloj pastillero el joel',
          style: TextStyle(color: Color.fromARGB(255, 245, 245, 245)),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: const Icon(
          Icons.camera_alt,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        actions: const [
          Icon(Icons.access_time, color: Color.fromARGB(255, 8, 7, 7)),
          SizedBox(width: 10), // Espacio opcional entre iconos
          Icon(Icons.medication, color: Color.fromARGB(255, 14, 12, 12)),
          SizedBox(width: 15), // Margen derecho
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: 4,
        // Crea el espacio entre tarjetas
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          // Definimos los datos directamente aquí para que sea funcional al instante
          final List<Map<String, dynamic>> items = [
            {'titulo': 'ibuprofeno', 'sub': '500mg', 'icon': Icons.person_rounded, 'color': Colors.indigo},
            {'titulo': 'aliviax', 'sub': '300mg', 'icon': Icons.account_balance_wallet_rounded, 'color': Colors.teal},
            {'titulo': 'paracetamol', 'sub': '500mg', 'icon': Icons.settings_suggest_rounded, 'color': Colors.orangeAccent},
            {'titulo': 'hiosina', 'sub': '300mg', 'icon': Icons.support_agent_rounded, 'color': Colors.pinkAccent},
          ];

          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: items[index]['color'].withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ListTile(
              // Bordes redondeados para que el efecto de clic (splash) no se salga del contenedor
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),

              // 1. LEADING (Icono con fondo suave)
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: items[index]['color'].withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(items[index]['icon'], color: items[index]['color']),
              ),

              // 2. TEXT (Título y Subtítulo)
              title: Text(
                items[index]['titulo'],
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              subtitle: Text(items[index]['sub']),

              // 3. TRAILING (Botón de acción sutil)
              trailing: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.chevron_right, color: Colors.grey),
              ),

              // 4. FUNCIONALIDAD (Acción al tocar)
              onTap: () {
                // Muestra un mensaje en la parte inferior al hacer clic
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Entrando a: ${items[index]['titulo']}'),
                    backgroundColor: items[index]['color'],
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    duration: const Duration(milliseconds: 800),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}