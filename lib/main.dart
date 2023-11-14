import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resapp/models/producShoes.dart';
import 'package:resapp/widgest/hedaders.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ProctuShoes(),
        builder: (context, child) => const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: HedersPage(),
            ));
  }
}
