import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieTrailer extends StatefulWidget {
  final String trailerUrl;
  const MovieTrailer({super.key, required this.trailerUrl});

  @override
  State<MovieTrailer> createState() => _MovieTrailerState();
}

class _MovieTrailerState extends State<MovieTrailer> {
  bool isPlaying = false;
  late YoutubePlayerController controller;
  @override
  void initState() {
    super.initState();
    initializeTrailerController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void initializeTrailerController() async {
    String videoId = widget.trailerUrl;

    if (videoId.isEmpty) {
      Fluttertoast.showToast(
        msg: 'Trailer Not Available',
        backgroundColor: Colors.red,
      );
      return;
    }

    controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        YoutubePlayerBuilder(
          player: YoutubePlayer(
            topActions: [],
            bottomActions: [
              CurrentPosition(),
              ProgressBar(isExpanded: true),
              RemainingDuration(),
            ],
            controller: controller,
            aspectRatio: 16 / 9,
          ),
          builder: (context, player) {
            return player;
          },
        ),
        if (controller.value.isPlaying)
          IconButton(
            onPressed: () {
              controller.pause();
              setState(() {
                isPlaying = false;
              });
            },
            icon: const Icon(Icons.clear),
          ),
      ],
    );
  }
}
