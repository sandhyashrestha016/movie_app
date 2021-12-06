// ignore_for_file: deprecated_member_use, prefer_const_constructors, duplicate_ignore, use_key_in_widget_constructors, file_names, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:movie_darklight/env/envconfig.dart';
import 'package:movie_darklight/provider/provider.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage();
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context,
          T Function<T>(ProviderBase<Object, T>) watch, Widget child) {
        final movie = watch(movieProvider);
        return Scaffold(
          appBar: AppBar(
            title: Text('${movie.title}'),
            elevation: 0,
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Stack(
                  // ignore: deprecated_member_use
                  overflow: Overflow.visible,
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  '${EnvironmentConfig.IMAGE_BASE_URL}${movie.backdropPath}'),
                              fit: BoxFit.cover)),
                    ),
                    Positioned(
                      left: 20,
                      bottom: -80,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 120,
                            width: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        '${EnvironmentConfig.IMAGE_BASE_URL}${movie.posterPath}'),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            children: [
                              Text(
                                "${movie.title}",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              const SizedBox(height: 20),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("${movie.releaseDate}"),
                                  const SizedBox(width: 50),
                                  Icon(
                                    Icons.star,
                                    size: 18,
                                  ),
                                  Text("${movie.voteAverage}/10"),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 100),
                const Divider(
                  thickness: 1.5,
                ),
                const SizedBox(height: 10),
                Text("${movie.overview}")
              ],
            ),
          ),
        );
      },
    );
  }
}
