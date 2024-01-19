import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/models/movie.dart';
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
          child: AppBar(
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
                  "In Theaters ${movie.release_date!.toMonthDayYear}",
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
                context.go('/movieDetail', extra: movie);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          )),
      body: Container(
        margin: const EdgeInsets.only(top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  ActionChip(
                    color: MaterialStateProperty.all(kLightBlue),
                    labelPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    label: const Text(
                      "5 Mar",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 10),
                  ActionChip(
                    labelPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    label: const Text(
                      "6 Mar",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 10),
                  ActionChip(
                    labelPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    label: const Text(
                      "7 Mar",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 10),
                  ActionChip(
                    labelPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    label: const Text(
                      "8 Mar",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 10),
                  ActionChip(
                    labelPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    label: const Text(
                      "9 Mar",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            // Center(
            //   child: Container(
            //     padding: const EdgeInsets.only(right: 20),
            //     width: double.infinity,
            //     child: CupertinoButton(
            //       color: kLightBlue,
            //       child: const Text("Select Seats"),
            //       onPressed: () {},
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
