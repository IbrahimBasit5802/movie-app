import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/theme/colors.dart';

class MQTTPage extends StatefulWidget {
  final MovieModel movie;
  const MQTTPage({super.key, required this.movie});

  @override
  State<MQTTPage> createState() => _MQTTPageState();
}

class _MQTTPageState extends State<MQTTPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            toolbarHeight: 80,
            title: const Text(
              "MQTT",
              style: TextStyle(
                color: Color(0xFF202C43),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            centerTitle: true,
            backgroundColor: kAppBarBackgroundColor,
            leading: IconButton(
              onPressed: () {
                context.go('/seatSelect', extra: widget.movie);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          )),
      body: const Center(
        child: Text('MQTT'),
      ),
    );
  }
}
