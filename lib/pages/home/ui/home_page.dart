import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/pages/home/bloc/home_bloc.dart';
import 'package:movie_app/pages/widgets/app_bar.dart';
import 'package:movie_app/pages/widgets/bottom_nav_bar.dart';
import 'package:movie_app/pages/widgets/movie_search_result.dart';
import 'package:movie_app/pages/widgets/movie_title_widget.dart';
import 'package:movie_app/theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = HomeBloc()..add(HomeFetchMoviesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CustomAppBar(homeBloc: _homeBloc)),
        bottomNavigationBar: const CustomBottomNavBar(),
        body: BlocConsumer<HomeBloc, HomeState>(
          bloc: _homeBloc,
          listenWhen: (previous, current) => current is HomeActionState,
          buildWhen: (previous, current) => current is! HomeActionState,
          builder: (BuildContext context, HomeState state) {
            if (state is HomeLoading || state is SearchLoading) {
              return const Center(
                child: CupertinoActivityIndicator(
                  animating: true,
                  color: kNavBarColor,
                  radius: 15,
                ),
              );
            } else if (state is HomeLoaded) {
              return ListView.builder(
                itemCount: state.movies.length,
                itemBuilder: (BuildContext context, int index) {
                  final movie = state.movies[index];
                  return MovieTitleWidget(
                    movie: movie,
                  );
                },
              );
            } else if (state is MoviesError) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is SearchLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(12, 50, 0, 20),
                    child: const Text(
                      'Top Results',
                      style: TextStyle(
                        color: Color(0xFF202C43),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0.10,
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Divider(
                        color: Colors.black.withOpacity(0.11),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.movies.length,
                      itemBuilder: (BuildContext context, int index) {
                        final movie = state.movies[index];
                        return GestureDetector(
                          onTap: () {
                            context.go('/movieDetail', extra: movie);
                          },
                          child: MovieSearchResult(
                            movie: movie,
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
          listener: (BuildContext context, HomeState state) {},
        ));
  }
}
