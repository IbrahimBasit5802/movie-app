import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/pages/widgets/ticket_screen_app_bar.dart';
import 'package:movie_app/theme/colors.dart';
import 'package:movie_app/util/date_formatter.dart';

class SeatSelectPage extends StatelessWidget {
  final MovieModel movie;
  const SeatSelectPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: TicketScreenAppBar(
            movie: movie,
            subTitleText:
                "${movie.release_date!.toMonthDayYear} | 12:30 Hall 1",
            route: '/theaterSelect',
          )),
      body: const Center(
        child: Text('Seat Select Page'),
      ),
    );
  }
}
