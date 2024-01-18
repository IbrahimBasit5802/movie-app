import 'package:flutter/material.dart';
import 'package:movie_app/theme/colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 15),
      decoration: const BoxDecoration(
        color: kNavBarColor,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_customize_sharp),
            label: 'Dashboard',
            backgroundColor: kNavBarColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_fill_rounded),
            label: 'Watch',
            backgroundColor: kNavBarColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_media_sharp),
            label: 'Media Library',
            backgroundColor: kNavBarColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz_sharp),
            label: 'More',
            backgroundColor: kNavBarColor,
          ),
        ],
      ),
    );
  }
}
