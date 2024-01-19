import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/pages/movie_detail/bloc/movie_detail_bloc.dart';
import 'package:movie_app/pages/widgets/movie_information_widget.dart';
import 'package:movie_app/pages/widgets/movie_poster.dart';
import 'package:movie_app/theme/colors.dart';

class MovieDetailPage extends StatefulWidget {
  final MovieModel movie;
  const MovieDetailPage({super.key, required this.movie});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  late final MovieDetailBloc _movieDetailBloc;
  bool showVideo = false;
  String videoId = "";

  @override
  void initState() {
    super.initState();
    _movieDetailBloc = MovieDetailBloc();
    _movieDetailBloc.add(MovieDetailInitialEvent(movie: widget.movie));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          leading: IconButton(
            onPressed: () {
              context.go('/');
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          title: const Text(
            'Watch',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: BlocConsumer<MovieDetailBloc, MovieDetailState>(
          bloc: _movieDetailBloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is MovieDetailLoading) {
              return const Center(
                child: CupertinoActivityIndicator(
                  animating: true,
                  color: kNavBarColor,
                  radius: 15,
                ),
              );
            } else if (state is MovieDetailLoaded) {
              return RefreshIndicator(
                onRefresh: () {
                  _movieDetailBloc
                      .add(MovieDetailInitialEvent(movie: widget.movie));
                  return Future.delayed(const Duration(seconds: 1));
                },
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    MoviePosterWidget(movie: widget.movie),
                    MovieInformationWidget(movie: widget.movie),
                  ],
                )),
              );
            } else if (state is MovieDetailError) {
              return Center(
                child: Text(state.message),
              );
            }
            return const SizedBox.shrink();
          },
        ));
  }
}
