import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
        body: Column(
          children: [
            Container(
              color: kBackgroundColor,
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/images/hall.jpeg'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton.small(
                      elevation: 0,
                      shape: const CircleBorder(),
                      backgroundColor: kAppBarBackgroundColor,
                      onPressed: () {},
                      child: const Icon(
                        Icons.add,
                        color: Colors.black,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                  child: FloatingActionButton.small(
                      elevation: 0,
                      shape: const CircleBorder(),
                      backgroundColor: kAppBarBackgroundColor,
                      onPressed: () {},
                      child: const Icon(
                        Icons.remove,
                        color: Colors.black,
                      )),
                )
              ],
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: kActionChipColor,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: kAppBarBackgroundColor,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(25, 25, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Image.asset(
                          'assets/icons/selected.png',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Selected',
                          style: TextStyle(
                            color: Color(0xFF8F8F8F),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Image.asset(
                          'assets/icons/notavailable.png',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Not Available',
                          style: TextStyle(
                            color: Color(0xFF8F8F8F),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ]),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(children: [
                        Image.asset(
                          'assets/icons/vip.png',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'VIP (150\$)',
                          style: TextStyle(
                            color: Color(0xFF8F8F8F),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                          'assets/icons/regular.png',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Regular (50\$)',
                          style: TextStyle(
                            color: Color(0xFF8F8F8F),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ]),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: kBackgroundColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize:
                              MainAxisSize.min, // Use min to fit content
                          children: [
                            const Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '4 /',
                                    style: TextStyle(
                                      color: Color(0xFF202C43),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.20,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' 3 row',
                                    style: TextStyle(
                                      color: Color(0xFF202C43),
                                      fontSize: 10,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.close,
                              ), // Adjust size to match your design
                              color: Colors
                                  .black, // Adjust color to match your design
                              onPressed: () {
                                // Handle the close button tap
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceEvenly, // Adjusted for even spacing
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                              height: 48, // Set a fixed height
                              width: MediaQuery.of(context).size.width * 0.3,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0), // Adjusted padding
                              decoration: BoxDecoration(
                                color: kBackgroundColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment
                                    .center, // Center the column content vertically
                                crossAxisAlignment: CrossAxisAlignment
                                    .center, // Align text to start
                                children: [
                                  Text(
                                    'Total Price',
                                    style: TextStyle(
                                      color: Color(0xFF202C43),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.20,
                                    ),
                                  ),
                                  Text(
                                    '\$ 50', // Your price goes here
                                    style: TextStyle(
                                      color: Color(0xFF202C43),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                              height:
                                  48, // Set a fixed height to match the Container's height
                              width: MediaQuery.of(context).size.width * 0.59,
                              child: CupertinoButton(
                                minSize:
                                    48, // Ensures the button is at least 48 units tall
                                padding: EdgeInsets
                                    .zero, // Remove padding to allow the button to expand
                                color: kLightBlue,
                                borderRadius: BorderRadius.circular(10),
                                child: const Text(
                                  'Proceed to pay',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.20,
                                  ),
                                ),
                                onPressed: () {
                                  context.go('/mqtt', extra: movie);
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
