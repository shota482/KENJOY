import 'package:flutter/material.dart';
import 'screens/regionScreen.dart';
import 'package:flutter/';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "kEnjoy",
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const RegionListPage(),
    );
  }
}