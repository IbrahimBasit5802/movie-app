import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';

class MovieTitleWidget extends StatelessWidget {
  final MovieModel movie;
  const MovieTitleWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      height: MediaQuery.of(context).size.height * 0.22,
      decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
              image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500${movie.backdrop_path}'),
              fit: BoxFit.cover),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          )),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
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
          Positioned(
            bottom: 0,
            child: SizedBox(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                  child: Text(
                    movie.original_title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
