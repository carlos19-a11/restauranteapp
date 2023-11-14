// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:resapp/screens/login.dart';
import 'package:resapp/widgest/custiompainter.dart';

class HedersPage extends StatelessWidget {
  const HedersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: const Color.fromARGB(253, 235, 233, 198),
      child: CustomPaint(
        painter:
            CustomPainterExample(), // Utiliza el nombre de la clase correctamente
        child: Padding(
          padding: const EdgeInsets.only(
            left: 50,
            right: 50,
            top: 100,
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/imag/munuticion.jpg",
                  //width: 200,
                  height: 350,
                ),
              ),
              const SizedBox(height: 80),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FloatingLoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(
                        255, 197, 14, 10), // Color de fondo del botón
                    onPrimary: Colors.white, // Color del texto del botón
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                  ),
                  child: const Text(
                    'Sguiente',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 150),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        "assets/imag/facebook.png",
                        width: 100,
                        height: 50,
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        // Acción a realizar cuando se presione el icono de Instagram
                      },
                      child: Image.asset(
                        "assets/imag/instagram.png",
                        width: 100,
                        height: 50,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
