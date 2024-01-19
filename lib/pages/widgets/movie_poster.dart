import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/theme/colors.dart';
import 'package:movie_app/util/date_formatter.dart';

class MoviePosterWidget extends StatelessWidget {
  const MoviePosterWidget({Key? key, required this.movie}) : super(key: key);

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        if (movie.poster_path!.isNotEmpty)
          Image.network(
            baseImageUrl + movie.poster_path.toString(),
            height: screenHeight * 0.6,
            width: screenWidth,
            fit: BoxFit.cover,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return Container(
                height: screenHeight * 0.6,
                width: screenWidth,
                color: Colors.grey,
              );
            },
          ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: screenHeight * 0.6,
            width: screenWidth,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black,
                ],
              ),
            ),
          ),
        ),
        Center(
          child: Column(
            children: [
              Text(
                "In Theaters ${movie.release_date!.toMonthDayYear}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 280,
                child: CupertinoButton(
                  onPressed: () {},
                  color: kLightBlue,
                  pressedOpacity: 0.8,
                  borderRadius: BorderRadius.circular(10),
                  child: const Text("Get Tickets",
                      style: TextStyle(fontWeight: FontWeight.w600)),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: kLightBlue),
                ),
                child: CupertinoButton(
                  onPressed: () {},
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.play_arrow),
                      SizedBox(width: 5),
                      Text(
                        "Watch Trailer",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ],
    );
  }
}
