import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resapp/models/producShoes.dart';
import 'package:resapp/models/product_tile.dart';
import 'package:resapp/widgest/navbar.dart';
import '../../models/prodc.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // remove item from cart
  void removerFromCart(Datum product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("eliminado exitosamente"),
              content:
                  Text('¿Estás seguro de que deseas realizar esta acción?'),
              actions: [
                // Botón para cancelar la acción
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Cierra el AlertDialog
                  },
                  child: Text('Cancelar'),
                ),
                // Botón para confirmar la acción
                TextButton(
                  onPressed: () {
                    // Aquí puedes realizar la acción deseada
                    // ...
                    Provider.of<ProctuShoes>(context, listen: false)
                        .removerItemFromCart(product);

                    // Cierra el AlertDialog
                    Navigator.of(context).pop();
                  },
                  child: Text('Confirmar'),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
          253, 235, 233, 198), // Set your desired background color here
      body: Consumer<ProctuShoes>(
        builder: (context, value, child) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                // heading
                const Text(
                  "Tu compras",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                // list of cart items
                Expanded(
                  child: ListView.builder(
                    itemCount: value.usershop.length,
                    itemBuilder: (context, index) {
                      // get individual cart items
                      Datum eachproducto = value.usershop[index];

                      // return products title
                      return ProductosTile(
                        product: eachproducto,
                        accionCart: (eachproducto) =>
                            removerFromCart(eachproducto),
                        icon: const Icon(Icons.delete),
                      );
                    },
                  ),
                ),
                GestureDetector(
                  onTap: payNow,
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: const Text(
                        "Comprar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      //bottomNavigationBar: NavbarButtom(),
    );
  }

  void payNow() {}
}

//  onPressed: () {
//                     // Implementa aquí la lógica para manejar el botón de "Volver"
//                     // Puedes usar Navigator.pop para volver a la pantalla anterior
//                     Navigator.pop(context);
//                   // },