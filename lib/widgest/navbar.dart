// ignore_for_file: deprecated_member_use

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:resapp/screens/login.dart';
import 'package:resapp/widgest/custiompainter.dart';

import '../productos.dart';

class NavbarButtom extends StatelessWidget {
  final void Function(int) indinceDePagina;

  NavbarButtom({Key? key, required this.indinceDePagina}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      animationDuration: Duration(milliseconds: 300),
      color: Colors.white,
      items: <Widget>[
        Image.asset("assets/imag/retirement-home.png", height: 30, width: 30),
        Image.asset("assets/imag/carrito-de-supermercado.png",
            height: 30, width: 30),
        Image.asset("assets/imag/empleados.png", height: 30, width: 30),
      ],
      onTap: (index) {
        indinceDePagina(index);
        print(index);
      },
    );
  }
}
