import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/pages/widgets/genre_chip.dart';

class MovieInformationWidget extends StatelessWidget {
  final MovieModel movie;
  const MovieInformationWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 15, 0),
            child: Text(
              'Genres',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
            child: GenreChipSection(genres: movie.genres),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
            child: Divider(
              color: Colors.black.withOpacity(0.11),
              indent: 30,
              endIndent: 30,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 15, 0),
            child: Text(
              'Overview',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 10),
          Center(
              child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: Text(
              movie.overview ?? "",
              style: const TextStyle(
                fontSize: 14,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
          ))
        ],
      ),
    );
  }
}
