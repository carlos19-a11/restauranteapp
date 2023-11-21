// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resapp/models/prodc.dart';
import 'package:resapp/models/producShoes.dart';
import 'package:resapp/models/product_tile.dart';
import 'package:resapp/providers/Auth.dart';

class ProducrtosPage extends StatefulWidget {
  int categoria;
  ProducrtosPage({Key? key, required this.categoria}) : super(key: key);

  @override
  State<ProducrtosPage> createState() => _ProducrtosPageState();
}

class _ProducrtosPageState extends State<ProducrtosPage> {
  List<Datum>? _listaProductos = [];
  late int dato;

  @override
  void initState() {
    super.initState();
    print(widget.categoria);
    _loadProductos();
  }

  void _loadProductos() async {
    List<Datum>? listProducts = await obtenerProductos(widget.categoria);
    setState(() {
      _listaProductos = listProducts;
    });
  }

  void addToCart(Datum product) {
    // print(product.name);
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
                      itemCount: _listaProductos?.length,
                      itemBuilder: (context, index) {
                        Datum eachproducto = _listaProductos![index];
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
