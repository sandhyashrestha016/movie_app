// ignore_for_file: unused_catch_clause, unused_local_variable, missing_return, avoid_print, empty_catches

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_darklight/env/envconfig.dart';
import 'package:movie_darklight/models/Movie_Model.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(
    baseUrl: EnvironmentConfig.BASE_URL,
  ));
});

final movieTypeProvider = StateProvider((ref) => MovieType.popular);

final moviesProvider = FutureProvider<List<Movie>>((ref) async {
  final movieType = ref.watch(movieTypeProvider).state;
  final dio = ref.watch(dioProvider);
  try {
    final response = await dio.get('movie/${movieType.value}',
        queryParameters: {'api_key': EnvironmentConfig.API_KEY});
    return MovieResponse.fromJson(response.data).results;
  } on DioError catch (error) {}

  print('Error loading');

  // final response = await dio.get('movie/${movieType.value}',
  //     queryParameters: {'api_key': EnvironmentConfig.API_KEY});
  // return MovieResponse.fromJson(response.data).results;
});

final movieProvider = ScopedProvider<Movie>((_) => throw UnimplementedError());
