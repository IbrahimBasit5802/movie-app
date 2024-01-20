import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/theme/colors.dart';

class TicketScreenAppBar extends StatelessWidget {
  const TicketScreenAppBar({
    super.key,
    required this.movie,
    required this.subTitleText,
    required this.route,
  });
  final String subTitleText;
  final MovieModel movie;
  final String route;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      backgroundColor: kAppBarBackgroundColor,
      title: Column(
        children: [
          Text(
            movie.original_title,
            style: const TextStyle(
              color: Color(0xFF202C43),
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 0.08,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            subTitleText,
            style: const TextStyle(
              color: kLightBlue,
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0.10,
            ),
          )
        ],
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          context.go(route, extra: movie);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
    );
  }
}
