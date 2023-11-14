import 'package:flutter/material.dart';
import 'package:resapp/models/prodc.dart';

class ProctuShoes extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
      name: 'esta es ua prueba',
      precio: '10.0',
      imagepath: "assets/imag/retirement-home.png",
    ),
    Product(
      name: 'esta es ua prueba',
      precio: '10.0',
      imagepath: "assets/imag/retirement-home.png",
    ),
    Product(
      name: 'esta es ua prueba',
      precio: '10.0',
      imagepath: "assets/imag/retirement-home.png",
    ),
    Product(
      name: 'esta es ua prueba',
      precio: '10.0',
      imagepath: "assets/imag/retirement-home.png",
    ),
  ];

  //user cart
  List<Product> _usercart = [];

  //get producto list
  List<Product> get productshop => _shop;

//get user cart
  List<Product> get usershop => _usercart;

  // add item to cart

  void addItemToCart(Product product) {
    _usercart.add(product);
    notifyListeners();
  }

  // remover item form cart

  void removItemFormCart(Product product) {
    _usercart.remove(product);
    notifyListeners();
  }
}
