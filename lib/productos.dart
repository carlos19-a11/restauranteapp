import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resapp/models/prodc.dart';
import 'package:resapp/models/producShoes.dart';
import 'package:resapp/models/product_tile.dart';
import 'package:resapp/widgest/navbar.dart';

class ProducrtosPage extends StatefulWidget {
  const ProducrtosPage({Key? key}) : super(key: key);

  @override
  State<ProducrtosPage> createState() => _ProducrtosPageState();
}

class _ProducrtosPageState extends State<ProducrtosPage> {
  void addToCart(Product product) {
    print(product.name);
    // add to cart

    //let user know it add been successflly added
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Añadida con éxito tu compra"),
        actions: [
          TextButton(
            onPressed: () {
              // Aquí puedes realizar la acción deseada
              // ...
              Provider.of<ProctuShoes>(context, listen: false)
                  .addItemToCart(product);

              // Cierra el AlertDialog
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Color.fromARGB(
            253, 235, 233, 198), // Set your desired background color here
        body: Consumer<ProctuShoes>(
          builder: (context, value, child) => SafeArea(
            child: Padding(
              padding: EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Text(
                    "Cómo te gustarían tus productos",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.productshop.length,
                      itemBuilder: (context, index) {
                        Product eachproducto = value.productshop[index];
                        return ProductosTile(
                          product: eachproducto,
                          icon: Icon(Icons.add),
                          accionCart: (eachproducto) => addToCart(eachproducto),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Implementa aquí la lógica para manejar el botón de "Volver"
                      // Puedes usar Navigator.pop para volver a la pantalla anterior
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Volver",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        //bottomNavigationBar: NavbarButtom(),
      ),
    );
  }
}
