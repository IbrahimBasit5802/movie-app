import 'package:flutter/material.dart';
import 'package:movie_app/pages/widgets/app_bar.dart';
import 'package:movie_app/pages/widgets/bottom_nav_bar.dart';
import 'package:movie_app/theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60), child: CustomAppBar()),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
