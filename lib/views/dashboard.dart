// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:resapp/productos.dart';
import 'package:resapp/views/cart.dart';
import 'package:resapp/views/home.dart';
import 'package:resapp/widgest/navbar.dart';

// ignore: must_be_immutable
class Dashborad extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variable
  const Dashborad({super.key});

  @override
  State<Dashborad> createState() => _DashboradState();
}

class _DashboradState extends State<Dashborad> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _page = [
    // shop page
    HomePage(),
    // cartpage
    CartPage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavbarButtom(
        indinceDePagina: navigateBottomBar,
      ),
      body: _page[_selectedIndex],
    );
  }
}
