import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/theme/colors.dart';

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
            'https://image.tmdb.org/t/p/w500${movie.poster_path}',
            height: screenHeight * 0.6,
            width: screenWidth,
            fit: BoxFit.cover,
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
                "In Theaters ${movie.release_date}",
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
