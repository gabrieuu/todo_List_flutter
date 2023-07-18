import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test/pages/home_page.dart';
import 'package:test/util/colors.dart';

main() {
  runApp(const MyApp());
}
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => { 
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    // etc.
  };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'Todo List',
      home: const HomePage()
    );
  }
}