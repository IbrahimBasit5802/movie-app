import 'package:flutter/material.dart';
import 'package:movie_app/models/genre.dart';
import 'package:movie_app/theme/colors.dart';

class GenreChipSection extends StatelessWidget {
  final List<Genre>? genres;
  const GenreChipSection({super.key, this.genres});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: _buildGenreChips(genres!),
    );
  }
}

// function to return list of chips
List<Widget> _buildGenreChips(List<dynamic> genres) {
  List<Widget> chips = [];
  for (var i = 0; i < genres.length; i++) {
    chips.add(
      Chip(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        label: Text(
          genres[i].name,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
        backgroundColor: (chipColors.toList()..shuffle()).first,
      ),
    );
  }
  return chips;
}
