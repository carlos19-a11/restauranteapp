// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resapp/models/prodc.dart';
import 'package:resapp/models/producShoes.dart';
import 'package:resapp/widgest/navbar.dart';

class ProducrtosPage extends StatefulWidget {
  const ProducrtosPage({super.key});

  @override
  State<ProducrtosPage> createState() => _ProducrtosPageState();
}

class _ProducrtosPageState extends State<ProducrtosPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
            body: Consumer<ProctuShoes>(
                builder: (context, value, child) => SafeArea(
                      //backgroundColor: Color.fromARGB(253, 235, 233, 198),
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
                            // lista de productos de conpras
                            Expanded(
                              child: ListView.builder(
                                itemCount: value.productshop.length,
                                itemBuilder: (context, index) {
                                  //get individual producto
                                  Product eachproducto =
                                      value.productshop[index];
                                  //retun the title for this products
                                  return ListTile(
                                    title: Text(eachproducto.name),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
            bottomNavigationBar: NavbarButtom()));
  }
}
