import 'package:flutter/material.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromARGB(253, 235, 233, 198),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Center(
                child: Text(
                  "L O G O ",
                  style: TextStyle(
                    fontSize: 35,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Image.asset("assets/imag/salida.png"),
              title: Text('S A L I R'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('¿Salir de la aplicación?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Cerrar el diálogo
                          },
                          child: Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Cerrar la aplicación
                            Navigator.of(context).pop(); // Cerrar el diálogo
                            Navigator.of(context)
                                .pop(); // Cerrar la página actual
                          },
                          child: Text('Salir'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
