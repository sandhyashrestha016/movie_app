// ignore_for_file: override_on_non_overriding_member, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_darklight/env/envconfig.dart';
import 'package:movie_darklight/provider/provider.dart';
import 'package:movie_darklight/widgets/movie%20details.dart';

class MovieList extends ConsumerWidget {
  const MovieList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final moviesAsyncValue = watch(moviesProvider);
    return moviesAsyncValue.maybeWhen(
        orElse: () => const Center(child: CircularProgressIndicator()),
        data: (movies) => Center(
              child: GridView.builder(
                  itemCount: movies?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    final movie = movies[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProviderScope(overrides: [
                                      movieProvider.overrideWithValue(movie)
                                    ], child: const MovieDetailsPage())));
                      },
                      child: Card(
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            "${EnvironmentConfig.IMAGE_BASE_URL}${movie.posterPath}",
                                          ))),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text("${movie.title}")
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2)),
            ));
  }
}
