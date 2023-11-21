import 'package:flutter/material.dart';
import 'package:resapp/widgest/custiompainter.dart';

import '../providers/Auth.dart';
import 'login.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController nombre = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController telefono = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: CustomPainterExample(),
        child: Stack(
          children: [
            // Imagen en la parte superior con ajuste de tamaño y posición
            Positioned(
              top: 60, // Ajusta esto para mover la imagen hacia arriba o abajo
              left: 160, // Cambia esto para ajustar la posición horizontal
              child: GestureDetector(
                onScaleUpdate: (details) {
                  // Escala la imagen
                  // Puedes usar details.scale para cambiar el tamaño de la imagen
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      15.0), // Ajusta el valor para el redondeo deseado
                  child: Image.asset(
                    "assets/imag/logominutricion.png",
                    fit: BoxFit.cover,
                    width: 150, // Cambia esto para ajustar el tamaño inicial
                    height: 150, // Cambia esto para ajustar el tamaño inicial
                  ),
                ),
              ),
            ),

            // Contenedor de registro
            Center(
              child: Card(
                margin: const EdgeInsets.all(25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Registro",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: nombre,
                        decoration: const InputDecoration(
                          labelText: "Nombre",
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: email,
                        decoration: const InputDecoration(
                          labelText: "Correo electrónico",
                        ),
                      ),
                      TextFormField(
                        controller: telefono,
                        decoration: const InputDecoration(
                          labelText: "Telefono",
                        ),
                      ),
                      const SizedBox(height: 10),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: password,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Contraseña",
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          signUp(email.text, nombre.text, password.text,
                              telefono.text, context);
                        },
                        child: const Text("Registrarse"),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          // TextButton(
                          //   onPressed: () {
                          //     // Acción a realizar cuando se presiona "Olvidaste tu contraseña"
                          //   },
                          //   child: Text("Olvidaste tu contraseña"),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
