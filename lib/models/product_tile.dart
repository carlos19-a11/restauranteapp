// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:resapp/models/prodc.dart';

class ProductosTile extends StatelessWidget {
  final Product product;
  void Function(Product)? accionCart;
  final Widget icon;
  ProductosTile(
      {super.key,
      required this.product,
      required this.accionCart,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: ListTile(
        title: Text(product.name),
        subtitle: Text(product.precio),
        leading: Image.asset(product.imagepath),
        trailing: IconButton(
          icon: icon,
          onPressed: () {
            accionCart!(product);
          },
        ),
      ),
    );
  }
}
