import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../views/views.dart';


class HomeScreen extends StatefulWidget {
  static const name = 'home-screen';
  final int pageIndex;

  const HomeScreen({super.key, required this.pageIndex});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin{
  late PageController pageController;
  final viewRoutes = const <Widget>[
    HomeView(),
    PopularMoviesView(),
    FavoritesView(),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: IndexedStack(
        index: widget.pageIndex,
        children: viewRoutes
      ),
      bottomNavigationBar: CustonBottomNavigation(currentIndex: widget.pageIndex,)
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}

