// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_darklight/models/Movie_Model.dart';
import 'package:movie_darklight/provider/provider.dart';

class MovieTags extends ConsumerWidget {
  const MovieTags({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final movieType = watch(movieTypeProvider).state;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: MovieType.values
          .map((type) => InkWell(
                onTap: () => context.read(movieTypeProvider).state = type,
                child: Chip(
                  label: Text(
                    "${type.name}",
                  ),
                  backgroundColor: type == movieType ? Colors.blue : null,
                ),
              ))
          .toList(),
    );
  }
}
