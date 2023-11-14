import 'package:flutter/material.dart';
import 'package:resapp/dashboar.dart';
import 'package:resapp/screens/registro.dart';
import 'package:resapp/widgest/custiompainter.dart';

class FloatingLoginScreen extends StatelessWidget {
  const FloatingLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: CustomPainterExample(),
        child: Stack(
          children: [
            // Imagen en la parte superior con ajuste de tamaño y posición
            Positioned(
              top: 50, // Cambia esto para ajustar la posición vertical
              left: 130, // Cambia esto para ajustar la posición horizontal
              child: GestureDetector(
                onScaleUpdate: (details) {
                  // Escala la imagen
                  // Puedes usar details.scale para cambiar el tamaño de la imagen
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      15.0), // Ajusta el valor para el redondeo deseado
                  child: Image.asset(
                    "assets/imag/munuticion.jpg",
                    fit: BoxFit.cover,
                    width: 200, // Cambia esto para ajustar el tamaño inicial
                    height: 200, // Cambia esto para ajustar el tamaño inicial
                  ),
                ),
              ),
            ),

            // Contenedor de inicio de sesión
            Center(
              child: Card(
                margin: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Inicio de sesión",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Correo electrónico",
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Contraseña",
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Dashborad()),
                          );
                        },
                        child: const Text("Iniciar sesión"),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const RegistrationScreen()),
                              );
                            },
                            child: const Text("Registrar"),
                          ),
                          TextButton(
                            onPressed: () {
                              // Acción a realizar cuando se presiona "Olvidaste tu contraseña"
                            },
                            child: const Text("Olvidaste tu contraseña"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Imágenes circulares en lugar de iconos de tipo botón
            Positioned(
              left: 10, // Cambia esto para ajustar la posición horizontal
              right: 10, // Cambia esto para ajustar la posición horizontal
              bottom: 150, // Cambia esto para ajustar la posición vertical
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Image.asset(
                      "assets/imag/facebook.png", // Ruta de la primera imagen
                      width: 50,
                      height: 50,
                    ),
                  ),
                  const SizedBox(width: 50),
                  ClipOval(
                    child: Image.asset(
                      "assets/imag/google.png", // Ruta de la segunda imagen
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
