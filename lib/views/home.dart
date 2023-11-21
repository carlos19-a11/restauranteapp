// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:resapp/productos.dart';
import 'package:resapp/widgest/drawer.dart';
import 'package:resapp/widgest/navbar.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var height, width;
  List imgData = [
    "assets/imag/cereales.png",
    "assets/imag/desayuno.png",
    "assets/imag/desayun.png",
    "assets/imag/taza.png",
    "assets/imag/postre.png",
    "assets/imag/zumo-de-naranja.png",
  ];

  List titles = [
    ["Saludable", 1],
    ["Clasico", 2],
    ["Matutina", 3],
    ["Cafes", 4],
    ["Postres", 5],
    ["Bebidas", 6],
  ];
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.amber,
          //height: height,
          width: width,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(),
                height: height * 0.23,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 35,
                        left: 20,
                        right: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Builder(
                            builder: (BuildContext context) {
                              return InkWell(
                                onTap: () {
                                  // Abre el Drawer cuando se hace clic en el ícono de clasificación
                                  Scaffold.of(context).openDrawer();
                                },
                                child: const Icon(
                                  Icons.sort,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              );
                            },
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                image: const DecorationImage(
                                    image:
                                        AssetImage("assets/imag/perfil.png"))),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Dashboard",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Last Update: 7 Nov 2023",
                            style: TextStyle(
                                color: Colors.white54,
                                fontSize: 16,
                                letterSpacing: 1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(253, 235, 233, 198),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  // height: height,
                  width: width,
                  padding: EdgeInsets.only(bottom: 20),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.1,
                      mainAxisSpacing: 25,
                    ),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: imgData.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProducrtosPage(
                                      categoria: titles[index][1],
                                    )),
                          );
                        },
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    spreadRadius: 1,
                                    blurRadius: 6)
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                imgData[index],
                                width: 100,
                              ),
                              Text(
                                titles[index][0],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: DrawerView(),
    );
  }
}
