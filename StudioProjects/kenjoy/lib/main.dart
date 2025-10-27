import 'package:flutter/material.dart';
import 'package:kenjoy/routers/router.dart';
import 'screens/regionScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser,
      routeInformationProvider: goRouter.routeInformationProvider,
      title: "kEnjoy",
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
    );
  }
}