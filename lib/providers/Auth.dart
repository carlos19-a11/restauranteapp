// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:resapp/models/prodc.dart';
import 'package:resapp/screens/login.dart';

import '../models/producShoes.dart' as auth;
import '../views/dashboard.dart';
import '../views/home.dart';

// import '../Model/Products.dart';

const ip = "http://192.168.1.16:3000/api/";

void signUp(email, username, password, phone, BuildContext context) async {
  final url = Uri.parse('${ip}auth/signup');
  final body = {
    "nombre": username,
    "telefono": phone,
    "email": email,
    "password": password
  };

  final headers = {'Content-Type': 'application/json'};

  final response =
      await http.post(url, body: jsonEncode(body), headers: headers);
  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FloatingLoginScreen()),
    );
  } else {
    // print()
    print('Error: ${response.reasonPhrase}');
  }
}

void signIn(email, password, BuildContext context) async {
  final url = Uri.parse('${ip}auth/signin');
  final body = {"email": email, "password": password};

  final headers = {'Content-Type': 'application/json'};

  final response =
      await http.post(url, body: jsonEncode(body), headers: headers);
  if (response.statusCode == 200) {
    print(response.body);
    // final responseData = jsonDecode(response.body);
    Map<String, dynamic> jsonMap = json.decode(response.body);
    String username = jsonMap['data']['nombre'];
    int id = jsonMap['data']['idUser'];
    print(username);
    // authTokenModel.setToken('nuevo_token_aqui');
    // print(responseData.data);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Dashborad(),
        ));

    print(response.body);
  } else {
    // print()
    print('Error: ${response.reasonPhrase}');
  }
}

Future<List<Datum>?> obtenerProductos(int categoria) async {
  print('obtenerProductos');
  print(categoria);
  final url = Uri.parse('${ip}products/findProducts/$categoria');
  final respuesta = await http.get(url);
  print(respuesta.body);
  final jsonResponse = json.decode(respuesta.body);
  return Product.fromJson(jsonResponse).data;
}

// void obtenerProductos(int categoria) async {
//   // print('obtenerProductos');
//   final url = Uri.parse('${ip}products/findProducts/$categoria');

//   // final url = Uri.parse('https://fakeapi.platzi.com/en/rest/products');
//   //final body = {"email": email, "password": password};

//   final headers = {'Content-Type': 'application/json'};

//   final response = await http.get(url);
//   if (response.statusCode == 200) {
//     // print(response);
//     // final responseData = jsonDecode(response.body);
//     Map<String, dynamic> jsonMap = json.decode(response.body);
//     // String username = jsonMap['data']['username'];
//     // print(jsonMap);
//   } else {
//     // print()
//     print('Error: ${response.reasonPhrase}');
//   }
// }
