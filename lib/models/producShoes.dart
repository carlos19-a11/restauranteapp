// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:resapp/models/prodc.dart';

class ProctuShoes extends ChangeNotifier {
  late String _token;

  final List<Datum> _shop = [];

  //user cart
  List<Datum> _usercart = [];

  //get Datumo list
  List<Datum> get productshop => _shop;

//get user cart
  List<Datum> get usershop => _usercart;

  // add item to cart
  String get token => _token;

  void addItemToCart(Datum product) {
    _usercart.add(product);
    notifyListeners();
  }

  // remover item form cart

  void removItemFormCart(Datum product) {
    _usercart.remove(product);
    notifyListeners();
  }

  void removerItemFromCart(Datum product) {
    _usercart.remove(product);
    notifyListeners();
  }

  void setToken(String newToken) {
    _token = newToken;
    notifyListeners();
  }
}
