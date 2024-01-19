import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/theme/colors.dart';

class MovieSearchResult extends StatelessWidget {
  final MovieModel movie;
  const MovieSearchResult({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              'https://image.tmdb.org/t/p/w500${movie.poster_path}',
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            // Wrap with Expanded to ensure the text doesn't overflow
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align text to the left
              mainAxisSize: MainAxisSize.min, // Use the minimum space
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(
                    movie.original_title,
                    style: const TextStyle(
                      color: Color(0xFF202C43),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                    overflow:
                        TextOverflow.ellipsis, // Prevent long text overflow
                  ),
                ),
                const SizedBox(height: 5), // Add space between title and genre
                const Text(
                  'Genre', // Replace with actual genre
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.more_horiz, // Three vertical dots icon
            color: kLightBlue,
          ),
        ],
      ),
    );
  }
}