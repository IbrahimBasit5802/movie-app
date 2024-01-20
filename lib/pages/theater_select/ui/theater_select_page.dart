import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/pages/widgets/custom_action_chip.dart';
import 'package:movie_app/pages/widgets/select_hall.dart';
import 'package:movie_app/pages/widgets/ticket_screen_app_bar.dart';
import 'package:movie_app/theme/colors.dart';
import 'package:movie_app/util/date_formatter.dart';

class TheaterSelectPage extends StatelessWidget {
  final MovieModel movie;
  const TheaterSelectPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: TicketScreenAppBar(
            movie: movie,
            subTitleText: "In Theaters ${movie.release_date!.toMonthDayYear}",
            route: '/movieDetail',
          )),
      body: Container(
        margin: const EdgeInsets.only(top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(23.0, 20, 20, 20),
              child: Text(
                'Date',
                style: TextStyle(
                  color: Color(0xFF202C43),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 0.08,
                ),
              ),
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 20),
                  CustomActionChip(
                    label: '5 Mar',
                    textColor: Colors.white,
                    color: kLightBlue,
                  ),
                  SizedBox(width: 10),
                  CustomActionChip(
                    label: '6 Mar',
                    textColor: Colors.black,
                    color: kActionChipColor,
                  ),
                  SizedBox(width: 10),
                  CustomActionChip(
                    label: '7 Mar',
                    textColor: Colors.black,
                    color: kActionChipColor,
                  ),
                  SizedBox(width: 10),
                  CustomActionChip(
                    label: '8 Mar',
                    textColor: Colors.black,
                    color: kActionChipColor,
                  ),
                  SizedBox(width: 10),
                  CustomActionChip(
                    label: '9 Mar',
                    textColor: Colors.black,
                    color: kActionChipColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SelectHallWidget(
                      time: '12:45 ',
                      hall: 'Cinetech + hall 1',
                      price: '50\$',
                      bonus: ' 2500 bonus'),
                  SelectHallWidget(
                      time: '13:30 ',
                      hall: 'Cinetech + hall 1',
                      price: '75\$',
                      bonus: ' 3000 bonus')
                ],
              ),
            ),
            Expanded(child: Container()),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                child: CupertinoButton(
                    color: kLightBlue,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: const Text(
                      'Select Seats',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.20,
                      ),
                    ),
                    onPressed: () {
                      context.go('/seatSelect', extra: movie);
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
