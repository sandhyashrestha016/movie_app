// ignore_for_file: avoid_unnecessary_containers, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_darklight/widgets/movie_list.dart';
import 'package:movie_darklight/widgets/movie_tags.dart';
import 'package:movie_darklight/widgets/title_widget.dart';

void main() {
  runApp(const ProviderScope(child: MyMovieApp()));
}

class MyMovieApp extends ConsumerWidget {
  const MyMovieApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final themeMode = watch(themeModeProvider).state;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dark Mode Demo',
      themeMode: themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // Add any other property here
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // Add any other property here
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Title1(),
          centerTitle: true,
          actions: [
            Consumer(builder: (BuildContext context,
                T Function<T>(ProviderBase<Object, T>) watch, Widget child) {
              final isDarkMode = watch(isDarkModeProvider);
              return CupertinoSwitch(
                  value: isDarkMode,
                  onChanged: (value) {
                    if (value) {
                      context.read(themeModeProvider).state = ThemeMode.dark;
                    } else {
                      context.read(themeModeProvider).state = ThemeMode.light;
                    }
                  });
            }),
          ],
        ),
        body: Column(
          children: const [
            MovieTags(),
            Expanded(child: MovieList()),
          ],
        ),
      ),
    );
  }
}

final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);
final isDarkModeProvider = Provider<bool>((ref) {
  final themeMode = ref.watch(themeModeProvider).state;
  return themeMode == ThemeMode.dark;
});
