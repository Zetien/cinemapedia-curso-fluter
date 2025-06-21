import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/movies/movie_masonry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopularMoviesView extends ConsumerStatefulWidget {
  const PopularMoviesView({super.key});

  @override
  PopularMoviesViewState createState() => PopularMoviesViewState();
}

class PopularMoviesViewState extends ConsumerState<PopularMoviesView> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context ) {
    super.build(context);
    
    final popularMovies = ref.watch( popularMoviesProvider );
    
    if ( popularMovies.isEmpty ) {
      return const Center(child: CircularProgressIndicator(strokeWidth: 2));
    }
    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MovieMasonry(
          loadNextPage: () => ref.read(popularMoviesProvider.notifier).loadNextPage(),
          movies: popularMovies
        ),
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}