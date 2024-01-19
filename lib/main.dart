import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/pages/home/ui/home_page.dart';
import 'package:movie_app/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const HomePage(),
    );
  }
}
