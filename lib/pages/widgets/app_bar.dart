import 'package:flutter/material.dart';
import 'package:movie_app/theme/colors.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>
    with SingleTickerProviderStateMixin {
  bool _isSearchBarVisible = false;

  late final AnimationController _animationController;
  late final Animation<Offset> _slideAnimation;

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
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
            onSubmitted: (value) {},
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
                  _toggleSearchBarVisibility!();
                  _searchController.clear();
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
                onPressed: _toggleSearchBarVisibility,
                icon: const Icon(Icons.search, color: Colors.black),
              )
      ],
    );
  }
}
