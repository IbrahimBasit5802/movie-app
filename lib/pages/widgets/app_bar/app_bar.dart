import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/pages/home/bloc/home_bloc.dart';
import 'package:movie_app/pages/widgets/app_bar/bloc/app_bar_bloc.dart';
import 'package:movie_app/theme/colors.dart';

class CustomAppBar extends StatefulWidget {
  final HomeBloc homeBloc;
  final Function(int) updateSearchResultsCount;

  const CustomAppBar({
    Key? key,
    required this.homeBloc,
    required this.updateSearchResultsCount,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>
    with SingleTickerProviderStateMixin {
  int _searchResultsCount = 0; // Add this line

  late AppBarBloc appBarBloc;
  bool _isSearchBarVisible = false;

  late final AnimationController _animationController;
  late final Animation<Offset> _slideAnimation;

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    appBarBloc = AppBarBloc();
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.2, 0),
      end: const Offset(0, 0),
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleSearchBarVisibility() {
    setState(() {
      _isSearchBarVisible = !_isSearchBarVisible;
    });
    if (_isSearchBarVisible) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBarBloc, AppBarState>(
      bloc: appBarBloc,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HomeMovieSearchCompleteState) {
          return _buildSearchAppBar();
        } else {
          return _buildDefaultAppBar();
        }
      },
    );
  }

  AppBar _buildSearchAppBar() {
    return AppBar(
      centerTitle: false,
      foregroundColor: Colors.black,
      backgroundColor: kAppBarBackgroundColor,
      leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.go('/');
          }),
      title: Text('$_searchResultsCount Results Found'),
    );
  }

  AppBar _buildDefaultAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      foregroundColor: Colors.black,
      backgroundColor: kAppBarBackgroundColor,
      title: AnimatedBuilder(
        animation: _slideAnimation,
        builder: (context, child) {
          return SlideTransition(
            position: _slideAnimation,
            child: child,
          );
        },
        child: Visibility(
          visible: _isSearchBarVisible,
          replacement: const Text('Watch'),
          child: TextField(
            controller: _searchController,
            onChanged: (value) {
              widget.homeBloc.add(HomeMovieSearchEvent(value));
            },
            onSubmitted: (value) {
              widget.homeBloc.add(HomeMovieSearchEvent(value));
              appBarBloc.add(HomeMovieSearchCompleteEvent());

              // Use the callback to update the number of search results
              if (widget.homeBloc.state is SearchLoaded) {
                // Update the local state with the count of search results
                setState(() {
                  _searchResultsCount =
                      (widget.homeBloc.state as SearchLoaded).movies.length;
                });
                // Call the callback function with the count
                widget.updateSearchResultsCount(_searchResultsCount);
              }
            },
            cursorColor: Colors.black,
            decoration: InputDecoration(
              filled: true,
              fillColor: kBackgroundColor,
              prefixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search, color: Colors.black),
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear, color: Colors.black),
                onPressed: () {
                  _toggleSearchBarVisibility();
                  _searchController.clear();
                  widget.homeBloc
                      .add(HomeMovieSearchCancelButtonClickedEvent());
                },
              ),
              hintText: 'TV Shows, Movies and more',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
      actions: [
        _isSearchBarVisible
            ? Container()
            : IconButton(
                onPressed: () {
                  _toggleSearchBarVisibility();
                },
                icon: const Icon(Icons.search, color: Colors.black),
              )
      ],
    );
  }
}
