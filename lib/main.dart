import 'package:flutter/material.dart';
import 'package:movie_app/routes/routes.dart';
import 'package:movie_app/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      routerConfig: router,
      theme: themeData,
    );
  }
}
