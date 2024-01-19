import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/database/database.dart';
import 'package:movie_app/routes/routes.dart';
import 'package:movie_app/theme/theme.dart';

Future<void> main() async {
  await dotenv.load(fileName: "config.env");

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
